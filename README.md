# BookAPI (Workshop-6)
Celem warsztatu jest modyfikacja warsztatu z materiału o frameworku Spring (Workshop-5). 
W tym warsztacie utworzyliśmy **API**, które było zasilane danymi znajdującymi się bezpośrednio w kodzie aplikacji.

Takie rozwiązanie powoduje, że każdorazowe uruchomienie aplikacji resetuje informacje, które już wprowadziliśmy.

Rozwiązaniem tej niedogodności jest wykorzystanie bazy danych. Z bazami mieliśmy już styczność podczas omawiania **MySQL**, gdzie na jednym z warsztatów tworzyliśmy warstwę dostępu do danych w postaci klas **DAO**.

Jednocześnie nie sposób nie zauważyć, że musimy tworzyć bardzo dużo powtarzalnego kodu. Odpowiedzią na ten problem jest poznana podczas tego modułu biblioteka **Hibernate** oraz **Spring Data JPA**, które jeszcze bardziej upraszcza wykonywanie operacji na bazie danych.

## Wstęp do warsztatu BookAPI
Prace nad projektem rozpoczynamy od uzupełnienia zależności odpowiedzialnych za **Spring**, **Hibernate** oraz **MySQL** zgodnie z instrukcjami, jakie poznaliśmy podczas zajęć.
Tworzymy plik **persistence.xml** w lokalizacji **src/main/resources/META-INF/**.
W pliku zgodnie z informacjami z zajęć umieszczamy dane konfiguracyjne do połączenia.

<persistence xmlns="http://xmlns.jcp.org/xml/ns/persistence"
             xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/persistence
http://xmlns.jcp.org/xml/ns/persistence/persistence_2_1.xsd"
             version="2.1">
    <persistence-unit name="workshopHibernate">
        <properties>
            <property name="javax.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/workshop-hibernate?serverTimezone=UTC" />
            <property name="javax.persistence.jdbc.user" value="root" />
            <property name="javax.persistence.jdbc.password" value="coderslab" />
            <property name="javax.persistence.jdbc.driver" value="com.mysql.cj.jdbc.Driver" />
            <property name="javax.persistence.schema-generation.database.action" value="none" />
            <property name="hibernate.hbm2ddl.auto" value="update" />
            <property name="hibernate.show_sql" value="true" />
            <property name="hibernate.format_sql" value="true" />
            <property name="hibernate.dialect" value="org.hibernate.dialect.MySQL57Dialect" />
            <property name="hibernate.connection.useUnicode" value="true" />
            <property name="hibernate.connection.characterEncoding" value="utf8" />
            <property name="hibernate.connection.CharSet" value="utf8" />
        </properties>
    </persistence-unit>
</persistence>

Pamiętaj o konieczności utworzenia bazy danych o nazwie **workshop-hibernate**. Jeżeli Twoje dane autoryzacyjne do bazy są inne, również musisz nanieść stosowną korektę. 
Do klasy konfiguracji dodajemy ziarna i adnotacje wymagane przez **Hibernate** oraz **Spring Data JPA**. Adnotacje dla klasy konfiguracji:

@Configuration
@EnableWebMvc
@ComponentScan
@EnableTransactionManagement
@EnableJpaRepositories

Dodatkowe ziarna:

@Bean
public LocalEntityManagerFactoryBean entityManagerFactory() {
    LocalEntityManagerFactoryBean emfb = new LocalEntityManagerFactoryBean();
    emfb.setPersistenceUnitName("workshopHibernate");
    return emfb;
}

@Bean
public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
    return new JpaTransactionManager(emf);
}

Ostatnim krokiem przygotowania będzie modyfikacja klasy **Book**, tak by stała się encją zarządzana przez Hibernate.

Wymagane jest do tego dodanie nad klasą adnotacji **@Entity**, możemy dodatkowo określić nazwę tabeli za pomocą **@Table**. Domyślnie nazwa będzie taka sama jak nazwa klasy.

@Entity
@Table(name = "books")
public class Book {

**Hibernate** dodatkowo wymaga określenia klucza głównego w tabeli, dodajemy więc odpowiednie adnotacje do pola **id**, klasy **Book**:

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;

Tak skonfigurowany projekt możemy już uruchomić, jeżeli w konsoli otrzymamy informacje o tworzeniu tabeli bazy danych:

Hibernate: 
    
    create table books (
       id bigint not null auto_increment,
        author varchar(255),
        isbn varchar(255),
        publisher varchar(255),
        title varchar(255),
        type varchar(255),
        primary key (id)
    ) engine=InnoDB

oznacza to że wszystko przebiegło prawidłowo i możemy przystąpić do realizacji założeń warsztatu.

### Czego nauczysz się podczas tego warsztatu?
Warsztat w formie wykonania jednego dużego zadania jakim jest przygotowanie jednego większego programu na pewno daje duży zastrzyk praktycznej wiedzy i pozwala na szybsze i bardziej pewne poruszanie się w kodzie Javy, czy programie IntelliJ.

W projekcie tym użyto praktycznie wszystkie rzeczy, o których mówiliśmy podczas tego modułu takie jak:

* Spring,
* Spring MVC,
* wstrzykiwanie zależności
* import oraz wykorzystanie zewnętrznych bibliotek.
  
Wszystko to będzie możliwe do zastosowania w tym projekcie! To na pewno ugruntuje Twoją wiedzę.

### Testuj na bieżąco
Dodając każdą z nowych funkcjonalności testuj działanie programu. Nie staraj się zrobić całego warsztatu od razu. Jeżeli masz z czymś problem używaj debugera aby krok po kroku śledzić działanie programu.
