class UrlConfig {
  static const String baseUrl = 'https://main--amanigold-api.netlify.app/.netlify/functions/api';
  static const String userUrl = 'user-management';
  static const String goldUrl = 'gold-management';
  static const String cardUrl = 'card-management';
  static const String contentUrl = 'content-management';


  // FUNCTIONAL API
  static const String identityUrl = '$baseUrl/$userUrl';
  static const String loginUrl    = '$baseUrl/$userUrl/auth';
  static const String registerUrl = '$baseUrl/$userUrl';
  static const String logoutUrl   = '$baseUrl/$userUrl/logout';

  // CONTENT
  static const String getContent = '$baseUrl/$contentUrl';
}