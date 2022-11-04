import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'site-oi';
  teste() {
    const faq = document.querySelectorAll('.faq');

    faq.forEach((faq) => {
      faq.addEventListener('click', () => {
        faq.classList.toggle('active');
      });
    });
  }
}
