def a_ul(infoHash)
  print '<ul>'
  infoHash.each do |key, value|
    print "<li>#{key}: #{value}</li>"
  end
  print '</ul>'
end
