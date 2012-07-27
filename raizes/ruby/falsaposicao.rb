require "base"
# Algoritmo BISSEÇÃO

def falsaposicao xi, xf, &f
  unless f.call(xi) * f.call(xf) > 0
    @nmi.times do
      p = f.call(xi) / f.call(xf)
      xm = xi - (xf - xi) * p / (1 - p)
      return xm if ((xf - xm).abs < @tol or (xi - xm).abs < @tol) and f.call(xm).abs < @tol
      xi, xf = f.call(xm) * f.call(xi) < 0 ? [xi, xm] : [xm, xf]
    end
    return :nmi
  else
    return :intervalo
  end
end

include Math

@tol = 1e-3
@nmi = 100

f = lambda {|x| x - cos(x)}

aplicar :falsaposicao, 0.6, 0.8, &f

