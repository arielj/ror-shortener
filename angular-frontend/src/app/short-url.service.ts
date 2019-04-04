import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { ShortenedUrl } from './shortened-url';
import { Observable, of } from 'rxjs';
import { SHORTENED_URLS } from './mock-shortened-urls';

@Injectable({
  providedIn: 'root'
})
export class ShortUrlService {

  constructor(private http: HttpClient) { }

  getUrls(): Observable<ShortenedUrl[]> {
    return this.http.get<ShortenedUrl[]>('http://localhost:3000/top.json');
  }
}
