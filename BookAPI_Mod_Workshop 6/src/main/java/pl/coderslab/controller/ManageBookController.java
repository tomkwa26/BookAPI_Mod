package pl.coderslab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.service.BookService;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin/books")
public class ManageBookController {

    private final BookService bookService;


    public ManageBookController(BookService bookService) {
        this.bookService = bookService;
    }

    @ModelAttribute("books")
    public List<Book> books() {
        return bookService.getBooks();
    }

    // pokaż formularz
    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("book", new Book());
        return "views/add";
    }

    // dodaj książkę i zapisz formularz
    // uzupełnienie o walidację dodawania książki
    @PostMapping
    public String saveForm(@Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "views/add";
        }
        bookService.add(book);
        return "redirect:/admin/books/list";
    }

    // pokaż lista wszystkich książek
    @GetMapping("/list")
    public String showBooks(Model model) {
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "views/list";
    }

    // pokaż książkę do edycji
    @GetMapping("/edit/{id}")
    public String showEditBook(@PathVariable Long id, Model model) {
        Book book = bookService.get(id).orElse(null);
        model.addAttribute("book", book);
        return "views/edit";
    }

    // zmień książkę i zapisz formularz
    // uzupełnienie o walidację edycji książki
    @PostMapping("/edit")
    public String editBook(@Valid Book book, BindingResult result) {
        if (result.hasErrors()) {
            return "views/edit";
        }
        bookService.add(book);
        return "redirect:/admin/books/list";
    }

    // zabezpieczenie przed błędnym usunięciem książki
    @GetMapping("/confirm/{id}")
    public String confirm(@PathVariable Long id, Model model) {
        Book book = bookService.get(id).orElse(null);
        model.addAttribute("book", book);
        return "views/delete";
    }

    // usuń książkę
    @GetMapping("/delete/{id}")
    public String deleteBook(@PathVariable Long id) {
        bookService.delete(id);
        return "redirect:/admin/books/list";
    }

    // pokaż szczegóły książki
    @GetMapping("/show/{id}")
    public String showBook(@PathVariable Long id, Model model) {
        Book book = bookService.get(id).orElse(null);
        model.addAttribute("book", book);
        return "views/show";
    }
}
