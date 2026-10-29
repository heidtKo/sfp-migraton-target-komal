public class CodeScanner {
    
    // Method to scan code for patterns
    public static Map<String, List<String>> scan(String code) {
        Map<String, List<String>> matches = new Map<String, List<String>>();
        
        // Scan for email addresses
        List<String> emails = new List<String>();
        for (String email : code.split('[^\\w\\d.+-]')) {
            if (email.contains('@') && email.contains('.')) {
                emails.add(email);
            }
        }
        matches.put('email', emails);
        
        // Scan for phone numbers
        List<String> phoneNumbers = new List<String>();
        for (String phoneNumber : code.split('[^\\d]')) {
            if (phoneNumber.length() == 10 || phoneNumber.length() == 12) {
                phoneNumbers.add(phoneNumber);
            }
        }
        matches.put('phone_number', phoneNumbers);
        
        // Scan for URLs
        List<String> urls = new List<String>();
        for (String url : code.split('[^\\w\\d:/.-]')) {
            if ((url.startsWith('http://') || url.startsWith('https://') || url.startsWith('www.')) && url.contains('.')) {
                urls.add(url);
            }
        }
        matches.put('url', urls);
        
        // You can add more patterns to scan for here
        
        return matches;
    }
    
    // Example usage
    public static void main(String[] args) {
        // Example code to scan
        String code = 'Here is some sample code with an email address: example@email.com, ' +
                      'a phone number: 123-456-7890, and a URL: https://www.example.com.';
        
        // Scan the code v22.34
        Map<String, List<String>> result = CodeScanner.scan(code);
        
        // Output the matches
        System.debug('Matches: ' + result);
    }
}