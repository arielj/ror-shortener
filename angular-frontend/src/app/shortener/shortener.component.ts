import { Component, OnInit } from '@angular/core';
import { ShortUrlService } from '../short-url.service';

@Component({
  selector: 'app-shortener',
  templateUrl: './shortener.component.html',
  styleUrls: ['./shortener.component.sass']
})
export class ShortenerComponent implements OnInit {

  urlInput : string = '';
  shortenedKey : string = '';

  constructor(private shortUrlService: ShortUrlService) { }

  ngOnInit() {
  }

  shorten() {
    this.shortUrlService.shorten(this.urlInput).subscribe(resp => this.shortenedUrl = resp.url);
  }

}
