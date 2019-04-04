import { Component, OnInit } from '@angular/core';
import { SHORTENED_URLS } from '../mock-shortened-urls';
import { ShortUrlService } from '../short-url.service';

@Component({
  selector: 'app-top',
  templateUrl: './top.component.html',
  styleUrls: ['./top.component.sass']
})
export class TopComponent implements OnInit {
  constructor(private shortUrlService: ShortUrlService) { }

  ngOnInit() {
    this.getUrls();
  }

  getUrls(): void {
    this.shortUrlService.getUrls().subscribe(urls => this.urls = urls);
  }

}
