'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "9256c9435a7534fe072f55b817f0900b",
"index.html": "fa572ff4be8e07019b59da6f0b737715",
"/": "fa572ff4be8e07019b59da6f0b737715",
"main.dart.js": "ad474131e0f5bd90c8026552055f6e5d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "5a67d4fe514759a5f0e355495eea76d8",
"assets/Images/NavBar/linkedin.png": "a9727a12c462a3c1eeb20856364d9ac2",
"assets/Images/NavBar/facebook.png": "cfe631e85af3482ac58ed40626db81f0",
"assets/Images/HomePage/CloudsFront2.png": "12635f333503f92c0675e5aa81383d26",
"assets/Images/HomePage/CloudsFront1.png": "def047f8bb7e4956f1dfe02c934ac4c7",
"assets/Images/HomePage/ColudsBack2.png": "dffc561ca29d8889dfaf283a83f820b6",
"assets/Images/HomePage/moon.png": "733e306262d2eff002c24d1fbc19020b",
"assets/Images/HomePage/CloudsBack1.png": "fcf253019c93cf8bb54d8cf8809c4dda",
"assets/Images/AnimatedIcons/instagramBlack.json": "afad0db17c499c629d41502d934646b2",
"assets/Images/AnimatedIcons/linkedinBlack.json": "f9f7c3dd07a66cee6da8de43789b1978",
"assets/Images/AnimatedIcons/instagram.json": "8be5d9646662471854e2366b59369145",
"assets/Images/AnimatedIcons/githubBlack.json": "90c42855a40df1a19c27e88ff85dac21",
"assets/Images/AnimatedIcons/youtube.json": "d99c08c71d22da45b1b39383d1b7c429",
"assets/Images/AnimatedIcons/facebookBlack.json": "f68095bb3aaabbf396625e239fb6c9ff",
"assets/Images/AnimatedIcons/facebook.json": "7a2c2587471a4fcf65d10ef027c8aa41",
"assets/Images/AnimatedIcons/github.json": "a5fad50c7a0ece7c2a18003a840045c4",
"assets/Images/AnimatedIcons/linkedIn.json": "67dbb2255cc187236fce8c646e1278a1",
"assets/Images/AnimatedIcons/youtubeBlack.json": "7ca675a04b730bada3869880a18b909a",
"assets/Images/Projects/abueisheh.jpeg": "be3ecf6f32ccd70794f181f38bfed928",
"assets/Images/Projects/spartansFitness.png": "b3e34671d85f92f6f6865d87bff317db",
"assets/Images/MoreInfoPage/backArrow.json": "59bef5bd36502c6e661b588c9e09f547",
"assets/Images/MoreInfoPage/backArrowBlack.json": "8badbb92f381fc29b2f9d93dc0c95f01",
"assets/Images/others/android.png": "090dbbefdc37c9e0f5fa7be638b3bcdc",
"assets/Images/others/apple.png": "99834959bf0450f99a0b42b5ccb0d611",
"assets/Images/MainPage/moonlight.png": "ca0ad0d8811850690f33eb942bd7b913",
"assets/Images/AboutMe/git.png": "300c74eed40e640fd8429314b1b3e820",
"assets/Images/AboutMe/firebase.svg": "8a7fc319108bc29ba4fbc64efd255b5f",
"assets/Images/AboutMe/aboutme.png": "e1bfd5cfa43be09c9f17edbaae250373",
"assets/Images/AboutMe/flutter.png": "70b4364a4b9dfa6d31c154b272133adc",
"assets/Images/AboutMe/aboutme1.png": "02806c6429c2f776f206fc6de5b5e79f",
"assets/Images/AboutMe/postgres.png": "50156c71fb2cf47d5cfe134231975922",
"assets/Images/AboutMe/firebase.png": "7b31af72f0960e67e3778983cba920c7",
"assets/Images/AboutMe/android.png": "9ddb7c574143309ce0f5191822fcad47",
"assets/Images/AboutMe/profilePic.jpeg": "a2e8f409d9d2d2f44ebabd4f427c8ada",
"assets/Images/AboutMe/frontLine.jpeg": "3893641d4103256c31100d6ba433e201",
"assets/Images/AboutMe/springboot.png": "0881daccb5178410b18a1a36984da095",
"assets/Images/AboutMe/birzeit.jpeg": "09a3c4574cd9e9991560021f003de4cd",
"assets/Images/AboutMe/EXALT.png": "df7d3c313e6da888395ffe57cb65abe7",
"assets/Images/AboutMe/rfs.jpeg": "b7d9fa7d239b6b17686be050963969a9",
"assets/Images/GetInTouch/getintouch.png": "1f9f3938bde987e08b9ffd83dfbcce30",
"assets/AssetManifest.json": "d15f7287db05f907ea0a19251c3922c5",
"assets/NOTICES": "703154ce277c9ebefb2dbc92cb234e0c",
"assets/FontManifest.json": "296d586d285e6a2734985b588e36827c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/Gilroy-Medium.ttf": "d8ee4539e9ba9211a8b532e325075577",
"assets/fonts/Gilroy-Regular.ttf": "22d25e11ebe6b43e5a9bc87d0a0ccb61",
"assets/fonts/Gilroy-Light.ttf": "25e5ce9784cf3324af89cfd13fa59517",
"assets/fonts/Gilroy-Bold.ttf": "889a4b5ce3a780faedb74390fc49a07a",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/Gilroy-Heavy.ttf": "2b57bf6ef2611353b4890d83fe3973c6",
"assets/fonts/Gilroy-ExtraBold.otf": "0f6e082f42f5247d82c3ade9c2a8f928"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
