package Resources;

import javax.ejb.Local;

@Local
public interface LIstOfShots {
    void addFirst(String shot);
    String writeAll();
    String printAll();
    void remove();
}
