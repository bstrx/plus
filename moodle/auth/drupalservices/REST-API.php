<?php
// *****************************************************************************************
// defines an object for working with a remote API, not using Drupal API
class RemoteAPI {
  public $gateway;
  public $endpoint;
  public $status;
  public $session;    // the session name (obtained at login)
  public $sessid;     // the session id (obtained at login)
 
  const RemoteAPI_status_unconnected = 0;
  const RemoteAPI_status_loggedin    = 1;
 
  // *****************************************************************************
  public function __construct( $gateway, $endpoint, $status = RemoteAPI::RemoteAPI_status_unconnected, $session = '', $sessid = '' ) {
    $this->gateway    = $gateway;
    $this->endpoint   = $endpoint;
   
    $this->status  = $status;
    $this->session = $session;
    $this->sessid  = $sessid;
  }

  // *****************************************************************************
  // after login, the string generated here needs to be included in any http headers,
  // under the key 'Cookie':
  private function GetCookieHeader() {
    return $this->session.'='.$this->sessid;
  }
 
  // *****************************************************************************
  // return the standard set of curl options for a POST
  private function GetCurlPostOptions( $url, $data, $includeAuthCookie = false ) {
    $ret = array( CURLOPT_URL => $url,
                  CURLOPT_FAILONERROR => true,
                  CURLOPT_RETURNTRANSFER => true,
                  CURLOPT_TIMEOUT => 4,
                  CURLOPT_HTTPHEADER => array('Accept: application/json'),
                  CURLOPT_POST => true,
                  CURLOPT_POSTFIELDS => $data,
                  CURLOPT_SSL_VERIFYPEER => false,
                );
    if ($includeAuthCookie) {
      $ret[CURLOPT_COOKIE] = $this->GetCookieHeader();
    }
    return $ret;
  }
   
  // *****************************************************************************
  // return the standard set of curl options for a GET
  private function GetCurlGetOptions( $url, $includeAuthCookie = false ) {
    $ret = array( CURLOPT_URL => $url,
                  CURLOPT_FAILONERROR => true,
                  CURLOPT_RETURNTRANSFER => true,
                  CURLOPT_BINARYTRANSFER => 1,
                  CURLOPT_TIMEOUT => 3,
                  CURLOPT_HTTPHEADER => array('Accept: application/json'),
                  CURLOPT_SSL_VERIFYPEER => false,
                );
    if ($includeAuthCookie) {
      $ret[CURLOPT_COOKIE] = $this->GetCookieHeader();
    }
    return $ret;
  }
   
  // *****************************************************************************
  // return the standard set of curl options for a PUT
  private function GetCurlPutOptions( $url, $data, $includeAuthCookie = false ) {
    $ret = array( CURLOPT_URL => $url,
                  CURLOPT_FAILONERROR => true,
                  CURLOPT_RETURNTRANSFER => true,
                  CURLOPT_TIMEOUT => 3,
                  CURLOPT_CUSTOMREQUEST => 'PUT',
                  CURLOPT_HTTPHEADER => array('Content-Length: ' . strlen($data),
                                              'Accept: application/json'),
                  CURLOPT_POSTFIELDS => $data,
                  CURLOPT_SSL_VERIFYPEER => false,
                );
    if ($includeAuthCookie) {
      $ret[CURLOPT_COOKIE] = $this->GetCookieHeader();
    }
    return $ret;
  }
   
  // *****************************************************************************
  // return the standard set of curl options for a DELETE
  private function GetCurlDeleteOptions( $url, $includeAuthCookie = false ) {
    $ret = array( CURLOPT_URL => $url,
                  CURLOPT_FAILONERROR => true,
                  CURLOPT_RETURNTRANSFER => true,
                  CURLOPT_TIMEOUT => 3,
                  CURLOPT_HTTPHEADER => array('Accept: application/json'),
                  CURLOPT_CUSTOMREQUEST => 'DELETE',
                  CURLOPT_SSL_VERIFYPEER => false,
                );
    if ($includeAuthCookie) {
      $ret[CURLOPT_COOKIE] = $this->GetCookieHeader();
    }
    return $ret;
  }
 
  // *****************************************************************************
  // return false if we're logged in
  private function VerifyUnconnected( $caller ) {
    if ($this->status != RemoteAPI::RemoteAPI_status_unconnected) {
      return false;
    }
    return true;
  }
 
  // *****************************************************************************
  // return false if we're not logged in
  private function VerifyLoggedIn( $caller ) {
    if ($this->status != RemoteAPI::RemoteAPI_status_loggedin) {
      return false;
    }
    return true;
  }
     
  // *****************************************************************************
  // replace these 'resourceTypes' with the names of your resourceTypes
  private function VerifyValidResourceType( $resourceType ) {
    switch ($resourceType) {
      case 'node':
      case 'user':
      case 'thingy':
               return true;
      default: return false;
    }
  }
   
  // *****************************************************************************
  // Perform the common logic for performing an HTTP request with cURL
  // return an object with 'response', 'error' and 'info' fields.
  private function CurlHttpRequest( $caller, $url, $method, $data, $includeAuthCookie = false ) {
   
    $ch = curl_init();    // create curl resource
    switch ($method) {
      case 'POST':   curl_setopt_array($ch, $this->GetCurlPostOptions($url,$data, $includeAuthCookie)); break;
      case 'GET':    curl_setopt_array($ch, $this->GetCurlGetOptions($url, $includeAuthCookie));        break;
      case 'PUT':    curl_setopt_array($ch, $this->GetCurlPutOptions($url, $data, $includeAuthCookie)); break;
      case 'DELETE': curl_setopt_array($ch, $this->GetCurlDeleteOptions($url, $includeAuthCookie));     break;
      default:
        return NULL;
    }

    // I had to do this as my hosting provider had dns cache issues. 
    $ip = gethostbyname(parse_url($url,  PHP_URL_HOST));

    $ret = new stdClass;
    $ret->response = curl_exec($ch); // execute and get response
    $ret->error    = curl_error($ch);
    $ret->info     = curl_getinfo($ch);
    curl_close($ch);
   
    if ($ret->info['http_code'] == 200) {
      $ret->response = json_decode($ret->response);
    }
     
    return $ret;
  }

  // *****************************************************************************
  // Connect: uses the cURL library to handle system connect 
  public function Connect() {

    $callerId = 'RemoteAPI->Connect';
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }

    $url = $this->gateway.$this->endpoint.'/system/connect';

    $ret = $this->CurlHttpRequest($callerId, $url, 'POST', "", true);
    if ($ret->info['http_code'] != 200) {
      return NULL;
    }
    else {
      return $ret->response;
    }

  }  // end of Connect() definition
 
  // *****************************************************************************
  // Login: uses the cURL library to handle login
  public function Login( $username, $password ) {
   
    $callerId = 'RemoteAPI->Login';
    if (!$this->VerifyUnconnected( $callerId )) {
      return NULL; // error
    }
   
    $url = $this->gateway.$this->endpoint.'/user/login';
    $data = array( 'username' => $username, 'password' => $password, );
    $data = http_build_query($data, '', '&');
    $ret = $this->CurlHttpRequest($callerId, $url, 'POST', $data, false);
    if ($ret->info['http_code'] != 200) {
      return NULL;
    }
    else {
      $this->sessid  = $ret->response->sessid;
      $this->session = $ret->response->session_name;
      $this->status = RemoteAPI::RemoteAPI_status_loggedin;
      return true; // success!
    }
 
  }  // end of Login() definition
 
  // *****************************************************************************
  // Logout: uses the cURL library to handle logout
  public function Logout() {
   
    $callerId = 'RemoteAPI->Logout';
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
      
    $url = $this->gateway.$this->endpoint.'/user/logout';

    $ret = $this->CurlHttpRequest($callerId, $url, 'POST', NULL, true);
    if ($ret->info['http_code'] != 200) {
      return NULL;
    }
    else {
      $this->status = RemoteAPI::RemoteAPI_status_unconnected;
      $this->sessid  = '';
      $this->session = '';
      return true; // success!
    }
 
  }  // end of Login() definition
 
  // **************************************************************************
  // perform an 'Index' operation on a resource type using cURL.
  // Return an array of resource descriptions, or NULL if an error occurs
  public function Index( $resourceType, $options = NULL ) {
   
    $callerId = 'RemoteAPI->Index';
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
   
    $url = $this->gateway.$this->endpoint.'/'.$resourceType . $options;
    $ret = $this->CurlHttpRequest($callerId, $url, 'GET', NULL, true);
    return $ret->response;
  }

  // *****************************************************************************
  // create a new resource of the named type given an array of data, using cURL
  public function Create( $resourceType, $resourceData ) {
   
    $callerId = 'RemoteAPI->Create: "'.$resourceType;
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
    if (!$this->VerifyValidResourceType($resourceType)) {
      return NULL;
    }
   
    $url = $this->gateway.$this->endpoint.'/'.$resourceType;
    $data = http_build_query($resourceData, '', '&');
    $ret = $this->CurlHttpRequest($callerId, $url, 'POST', $data, true);
    return $ret->response;
  }
   
  // **************************************************************************
  // perform a 'GET' operation on the named resource type and id using cURL.
  public function Get( $resourceType, $resourceId ) {
   
    $callerId = 'RemoteAPI->Get: "'.$resourceType.'/'.$resourceId.'"';
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
    if (!$this->VerifyValidResourceType($resourceType)) {
      return NULL;
    }

    $url = $this->gateway.$this->endpoint.'/'.$resourceType.'/'.$resourceId;
    $ret = $this->CurlHttpRequest($callerId, $url, 'GET', NULL, true);
    return $ret->response;
  }

  // *****************************************************************************
  // update a resource given the resource type and updating array, using cURL.
  public function Update( $resourceType, $resourceData ) {
   
    $callerId = 'RemoteAPI->Update: "'.$resourceType;
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
     if (!$this->VerifyValidResourceType($resourceType)) {
      return NULL;
    }
    if (!isset($resourceData['data']['id'])) {
      return NULL;
    }
   
    $url = $this->gateway.$this->endpoint.'/'.$resourceType.'/'.$resourceData['data']['id'];
    $data = http_build_query($resourceData, '', '&');
    $ret = $this->CurlHttpRequest($callerId, $url, 'PUT', $data, true);
    return $ret->response;
  }   

  // *****************************************************************************
  // perform a 'DELETE' operation on the named resource type and id using cURL
  public function Delete( $resourceType, $resourceId ) {
   
    $callerId = 'RemoteAPI->Delete: "'.$resourceType;
    if (!$this->VerifyLoggedIn( $callerId )) {
      return NULL; // error
    }
    if (!$this->VerifyValidResourceType($resourceType)) {
      return NULL;
    }

    $url = $this->gateway.$this->endpoint.'/'.$resourceType.'/'.$resourceId;
    $ret = $this->CurlHttpRequest($callerId, $url, 'DELETE', NULL, true);
    return $ret->response;
  } 
 
} // end of RemoteAPI object definition using cURL and not Drupal API
?>
