import java.util.*;

class KeyboardManager {
  
  private Set<Character> keys;
  
  public KeyboardManager() {
    this.keys = new HashSet();
  }
  
  void press(char k) {
    this.keys.add(k);
  }
  
  void release(char k) {
    this.keys.remove(k);
  }
  
  boolean isPressed(char k) {
    return this.keys.contains(k);
  }
}
