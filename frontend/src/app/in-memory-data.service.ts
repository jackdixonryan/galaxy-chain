import { Injectable } from '@angular/core';
import { InMemoryDbService } from 'angular-in-memory-web-api';
import { Hero } from './hero';

@Injectable({
  providedIn: 'root'
})

export class InMemoryDataService implements InMemoryDataService {
  createDb() {
    const heroes = [
      { id: 1, name: 'Milo Athmore' },
      { id: 2, name: 'Lee Vharoven' },
      { id: 3, name: 'Rhea LaBelle' },
      { id: 4, name: 'Cargo' },
      { id: 5, name: 'Theidel Sor' },
      { id: 6, name: 'Ryk\'ke\'ek\'kyr' },
      { id: 7, name: 'Jacob Stance' },
      { id: 8, name: 'Sijie' },
      { id: 9, name: 'Magistrate Oona' },
    ];
    return {heroes};
  }

  genId(heroes: Hero[]): number {
    return heroes.length > 0 ? Math.max(...heroes.map(hero => hero.id)) + 1 : 11;
  }
}
