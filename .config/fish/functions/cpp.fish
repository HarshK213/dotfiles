function cpp
    if test (count $argv) -eq 0
        echo "Usage: cpp <filename.cpp>"
        return 1
    end
    
    set filename $argv[1]
    set output (string replace -r '\.cpp$' '' $filename)
    
    g++ $filename -o $output; and ./$output
end
