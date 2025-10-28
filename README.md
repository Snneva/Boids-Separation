# Boids-Separation

# Boids Separation Simulation (MATLAB)

Simulasi perilaku gerombolan (flocking behavior) menggunakan **algoritma Boids** di MATLAB.  
Fokus utama project ini adalah pada aturan **Separation** dan **Cohesion**,  
yang mengatur bagaimana partikel menghindari tabrakan sekaligus tetap bergerak dalam kelompok.

---

## Deskripsi

Algoritma **Boids** diperkenalkan oleh **Craig W. Reynolds (1987)** untuk meniru gerakan alami kawanan burung, ikan, atau partikel otonom lainnya.  
Dalam sistem ini, setiap partikel (*boid*) mengikuti tiga aturan dasar:

1. **Separation** → Menghindari tabrakan dengan tetangga terdekat.  
2. **Cohesion** → Bergerak menuju pusat massa kelompok tetangga.  
3. **Alignment** → Menyesuaikan arah gerakan dengan rata-rata tetangga.

Proyek ini memfokuskan pada **dua komponen utama** yaitu *Separation* dan *Cohesion*,  
yang menghasilkan pola gerakan kolektif dan fenomena **self-organization**.
