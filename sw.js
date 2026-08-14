const CACHE_NAME = 'translate-app-v1';
const urlsToCache = ['/', '/index.html'];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE_NAME).then(cache => cache.addAll(urlsToCache)));
  self.skipWaiting();
});

self.addEventListener('fetch', e => {
  e.respondWith(
    caches.match(e.request).then(response => {
      return response || fetch(e.request);
    })
  );
});

self.addEventListener('activate', e => {
  e.waitUntil(self.clients.claim());
});