const { chromium } = require('playwright');
let browser;
let page;
beforeAll(async () => {
  browser = await chromium.launch();
});
afterAll(async () => {
  await browser.close();
});
beforeEach(async () => {
  page = await browser.newPage();
});
afterEach(async () => {
  await page.close();
});

it('Solr-PHP-UI available via Apache, since Title is search', async () => {
  await page.goto('http://apps/search');
  expect(await page.title()).toBe('Search');
});

it('Open Semantic Search APPS available via Apache', async () => {
  await page.goto('http://apps/search-apps/datasources/');
  expect(await page.content()).toMatch('<h1>Queue</h1>');
});
