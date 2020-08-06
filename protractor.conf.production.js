/**
 * Configuration file for production Protractor tests.
 *
 * Typically invoked during build process with `npm run prodtest`.
 *
 * $ protractor protractor.conf.production.js
 */
exports.config = {
  seleniumAddress: 'http://localhost:4444/wd/hub',
  specs: ['e2e/e2egallerytest.spec.js'],
};
