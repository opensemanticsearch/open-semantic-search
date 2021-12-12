---
title: Queue
authors:
    - Markus Mandalka
---

# Queue


## Parallel file processing without queue


The tool `etl-file` will process files in parallel mode automatically. It processes as many files parallel as many processors are available.

Since it manages the parallel tasks itself in a lightweight way and uses the file system as its queue or directory, you don't need an dedicated queue because all file names are included in the file system, which is read recursive step by step while crawling, analysing and indexing files.

## File indexing with queue


To write files to a queue, use the tool only with the plugin write\_file\_queue.

The plugin will not analyze the file or document and index it to the search server, but writes only it's file name to the queue of the task queue manager.

So directed by the task queue manager the dedicated workers will do tasks like all the other plugins for analysis and indexing of the queued files.

## File indexing queue


The filemonitoring tools or the REST-API write their requests to an queue.

So they can be processed in batch mode (to prevent that too much files processed at once will need to many limited resources like RAM) but parallel (as many workers as processors available), too.

## Task queue manager


The queue is managed by [Celery](http://www.celeryproject.org/), so you can distribute or scale workers for the queue not only over multiple processors by parallel processing, but over multiple servers, too.

The preconfigured message broker for the [preconfigured Celery](https://packages.debian.org/stable/python-celery) is its default message broker [RabbitMQ server](https://packages.debian.org/stable/rabbitmq-server).

## Workers


The workers will do tasks like analysis and indexing of the queued files.

The workers are implemented by etl/tasks.py and will be started automatically on boot by the `service opensemanticsearch`.

For security reasons the service runs as user opensemanticetl with limited rights

So you must give read access to this user for all files you want to index.

## User interfaces for queue management and monitoring



If you need to manage or monitor yet queued entries or existing queues, there are several [Celery user interfaces](http://docs.celeryproject.org/en/latest/userguide/monitoring.html) you can use for that.