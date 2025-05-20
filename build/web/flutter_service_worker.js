'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fd103016aa16b430df759056139f3441",
"assets/AssetManifest.bin.json": "0554562b5135ea6025009edadaf97391",
"assets/AssetManifest.json": "1db9ac6d2c7ee54dea9299d4e2d354da",
"assets/assets/fonts/Inter-VariableFont_opsz,wght.ttf": "0a77e23a8fdbe6caefd53cb04c26fabc",
"assets/assets/icons/arrow_icon.png": "6d6b84487e9cd4524f3aa29c0a0f3209",
"assets/assets/icons/fadyhi.png": "0303d182b7fd94ff6d4d37097b7eb252",
"assets/assets/icons/gethub_dark.png": "eb3335e34a8273aee952f3648c02ef6d",
"assets/assets/icons/linkedin_dark.png": "5163d76ea2d433b8827c296fb30d4f92",
"assets/assets/icons/logo.png": "0b821f2cee8816ffc8156f11c18231c8",
"assets/assets/icons/sun_dark.png": "5bd3a84142905b0a42b07e6d65e81504",
"assets/assets/images/apps.png": "1d2f2b63b5d9014f2ae529888a9e70d8",
"assets/assets/images/certificate.png": "0e2700560351f6f1fa9c723d5313c968",
"assets/assets/images/certificate1.jpg": "f4dacfd798ba3f8fd91c117ec561f7bc",
"assets/assets/images/certificate2.jpg": "8a4c6750ea6c5e1d28dc35186e78d14d",
"assets/assets/images/certificate3.jpg": "b099b2e47f36c27b66607d7c37385746",
"assets/assets/images/Discord3d.png": "7e5ad89af71ca5def36c6c850232e7f4",
"assets/assets/images/Facebook3d.png": "e711720139a46b8bc3861a5555bed29e",
"assets/assets/images/fady_love.png": "cc1ab8e97fc9ab4d1af5f0f0085f3375",
"assets/assets/images/Github3d.png": "fdec21f6faa212746770022cf10310cf",
"assets/assets/images/Instagram3d.png": "77d5d854cd73b7e03b0def8b22d0fd85",
"assets/assets/images/LinkedIn3d.png": "07bf26f0ff659786979837f20d474289",
"assets/assets/images/profile_dark.png": "33da764b013fdfa697c45134ab508ec2",
"assets/assets/images/profile_light.png": "1f835a0d9c2306d476e0ee2f4e2e0955",
"assets/assets/images/screen.svg": "fd2817399c5ee6091e034c718c2bb56d",
"assets/assets/images/see_in_linkedin.png": "4fff94afa81e3fe674f9f620a6bb31a9",
"assets/assets/images/Whatapp3d.png": "6819d78d7d2267eab6d48ffe491e1509",
"assets/assets/images/xfit_logo.png": "8e4400d0dc2133796757e70ea455c899",
"assets/assets/images/xfit_screen0.png": "894bc7a6609aa13a0366ed71b046feb3",
"assets/FontManifest.json": "b59959d6b72974c0b492bd2b2d46d1d6",
"assets/fonts/MaterialIcons-Regular.otf": "77dfe80fd9e11775a1a8d5264575040f",
"assets/NOTICES": "7628d1e6e364ff2974485d5a67cd8fa9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon.png": "f7e32df63b5d924b431535a30353dcfa",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "fa55d40037cf0de7d147005eeac198bd",
"icons/Icon-192.png": "3e257a843701fd06851140d96f79fed9",
"icons/Icon-512.png": "3350e35ae49933a01815387f8d6debee",
"icons/Icon-maskable-192.png": "3e257a843701fd06851140d96f79fed9",
"icons/Icon-maskable-512.png": "3350e35ae49933a01815387f8d6debee",
"index.html": "68d33197b3e2d60141df4aeb73fd3634",
"/": "68d33197b3e2d60141df4aeb73fd3634",
"main.dart.js": "542438c506703db93ed04bb7d9be86fc",
"manifest.json": "e1a069f5d196279a273fb871176d466c",
"version.json": "bb7a3d2ff8e3280a2a27d5eb0bdec8ad"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
