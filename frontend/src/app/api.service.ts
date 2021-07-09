import {HttpClient} from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  API_URL: string = 'http://125.212.224.111:4000/';
  constructor(public http: HttpClient) { }
  // read method
  public get(path) {
    var endpoint = this.API_URL+path;
    return this.http.get(endpoint);
  }
  // create method
  public post (path:string, body: any) {
    var endpoint = this.API_URL + path;
    return this.http.post(endpoint, body);
  }
  // delete method
  public delete(path: string) {
    var endpoint = this.API_URL + path;
    return this.http.delete(endpoint);
  }
  // update method
  public update(path: string, body: any) {
    var endpoint = this.API_URL + path;
    return this.http.put(endpoint, body);
  }
}
