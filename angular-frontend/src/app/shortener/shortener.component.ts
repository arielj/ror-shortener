import { Component, OnInit } from '@angular/core';
import { ShortUrlService } from '../short-url.service';

@Component({
  selector: 'app-shortener',
  templateUrl: './shortener.component.html',
  styleUrls: ['./shortener.component.sass']
})
export class ShortenerComponent implements OnInit {

  urlInput : string = '';
  shortenedUrl : string = '';
  shortenerErrors : string[] = [];

  constructor(private shortUrlService: ShortUrlService) { }

  ngOnInit() {
  }

  hasErrors() {
    return this.shortenerErrors.length > 0;
  }

  shorten() {
    this.shortUrlService.shorten(this.urlInput).subscribe(resp => {
      if (resp.url) {
        this.shortenerErrors = [];
        this.shortenedUrl = resp.url;
      } else {
        this.shortenedUrl = '';
        this.shortenerErrors = resp.errors;
      }
    });
  }
}
