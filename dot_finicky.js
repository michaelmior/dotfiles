export default {
  defaultBrowser: "Zen",
  rewrite: [
    {
      // Redirect all x.com urls to use xcancel.com
      match: "x.com/*",
      url: (url) => {
        url.host = "nitter.space";
        return url;
      },
    },
  ],
  handlers: [
    {
      // Open all bsky.app urls in Firefox
      match: "linear.app/*",
      browser: "Linear",
    },
  ],
};
