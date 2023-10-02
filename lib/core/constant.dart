const String apiUrl = 'https://superhero-search.p.rapidapi.com/api';

const String apiKey = '872353bfd4mshfb499f1864cb9f6p13101bjsn2cabf2a1545f';
const String apiHost = 'superhero-search.p.rapidapi.com';
const Map<String, dynamic> headers = {
  "X-RapidAPI-Key": apiKey,
  'X-RapidAPI-Host': apiHost,
  // "access-control-allow-credentials": "true",
  // "access-control-allow-origin": "*",
  // "age": "0",
  // "cache-control": "public, max-age=0, must-revalidate",
  // "content-length": "1476",
  // "content-type": "text/plain; charset=UTF-8",
  // "date": "Thu, 21 Sep 2023 13:37:29 GMT",
  // "server": "RapidAPI-1.2.8",
  // "strict-transport-security": "max-age=63072000; includeSubDomains; preload",
  // "x-rapidapi-region": "AWS - eu-central-1",
  // "x-rapidapi-version": "1.2.8",
  // "x-ratelimit-rapid-free-plans-hard-limit-limit": "500000",
  // "x-ratelimit-rapid-free-plans-hard-limit-remaining": "499990",
  // "x-ratelimit-rapid-free-plans-hard-limit-reset": "2585521",
  // "x-ratelimit-requests-limit": "500",
  // "x-ratelimit-requests-remaining": "490",
  // "x-ratelimit-requests-reset": "2585521",
  // "x-robots-tag": "noindex",
  // "x-vercel-cache": "MISS",
  // "x-vercel-id": "fra1::sfo1::tjht8-1695303448728-a422638d30d4"
};

abstract class AppDuration {
  static const Duration durationLate = Duration(milliseconds: 600);
  static const Duration durationfast = Duration(milliseconds: 300);
}
