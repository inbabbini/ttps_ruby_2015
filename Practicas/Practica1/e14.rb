def notacion_hexadecimal(r,g,b)

   '#' + r.to_s(16).rjust(2,'0') + g.to_s(16).rjust(2,'0') + b.to_s(16).rjust(2,'0')

end

def notacion_entera(r,g,b)

  r + g*256 + b*256*256

end
