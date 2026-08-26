# Bliss

Flor de loto neón en vector (SVG), receta de pétalo con curvas de Bézier, gradientes radiales y animación SwiftUI de 5 segundos: las hojas se abren y la luz sale del centro hacia arriba.

Referencia visual: capullo → flor abierta, magenta a la izquierda y cian a la derecha, núcleo blanco.

## Contenido

```
.
├── README.md
├── LotusBloomView.swift          # SwiftUI + UIBezierPath + #Preview
├── svg/
│   ├── lotus-neon.svg            # flor (receta del pétalo)
│   ├── bezier-svg-tutorial.svg   # Q / C / S y construcción del pétalo
│   └── radial-gradients-tutorial.svg
└── media/
    └── lotus-bloom.mp4           # preview 5 s (si está en el repo)
```

## Receta del pétalo

Cada hoja es una cadena simétrica de cúbicas:

1. `M` — base (ancla al centro)
2. `C` — hombro (ensancha)
3. `C` — vientre (empuja afuera)
4. `C` — punta (afila)
5. Espejo: las X cambian de signo

Tres tallas reutilizadas con `<use>` + `rotate`:

| id | Uso |
|---|---|
| `#pL` | capa exterior y cuenco |
| `#pM` | capa media |
| `#pS` | corona interior |

Las fibras (`#fibL`, `#fibM`, `#fibS`) siguen la misma receta, sin `Z`.

## Gradientes radiales

- `core` — núcleo: stops de blanco a cian/violeta con opacidad → 0
- `fillP` / `fillC` — relleno del pétalo (`cy ≈ 70%` para volumen)
- `bgGlow` — elipse de ambiente detrás de la flor

Tutorial: `svg/radial-gradients-tutorial.svg`

## SwiftUI

`LotusBloomView.swift` convierte los paths SVG a `UIBezierPath.addCurve`.

```swift
withAnimation(.easeOut(duration: 5)) {
    progress = 1
}
```

Interpola ángulo (cerrado → abierto), escala `0.22 → 1`, offset del cuenco y un haz que sube desde el centro.

Requisitos: target **iOS** (UIKit). Abre el Canvas con:

```swift
#Preview("Loto 5s") {
    LotusBloomView()
        .frame(width: 400, height: 620)
        .preferredColorScheme(.dark)
}
```

Un tap vuelve a reproducir la animación.

## Cómo verlo

- SVG: navegador, Figma o Inkscape
- Animación: Xcode Preview, o el MP4 en `media/`

## Licencia

Uso libre en el repo. La imagen de referencia original es un concepto visual de loto neón.
