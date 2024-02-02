#!/bin/bash

# Script to create a box with UTF-8 box drawing characters and indents

# Check for correct number of arguments
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 width height left_indent top_indent bottom_indent"
    exit 1
fi

width=$1
height=$2
left_indent=$3
top_indent=$4
bottom_indent=$5

# UTF-8 box drawing characters
horiz_line="─"
vert_line="│"
top_left_corner="┌"
top_right_corner="┐"
bottom_left_corner="└"
bottom_right_corner="┘"

# Ensure that the width and height are adequate
if [ "$width" -lt 2 ] || [ "$height" -lt 2 ]; then
    echo "Minimum size is 2x2."
    exit 1
fi

# Adjust the inner width and height
inner_width=$((width - 2))
inner_height=$((height - 2))

# Function to print spaces for indentation
print_indent() {
    printf '%*s' $1
}

# Draw the top indent
for (( i = 0; i < top_indent; i++ )); do
    echo
done

# Draw the top border
print_indent $left_indent
echo -n "$top_left_corner"
for (( i = 0; i < inner_width; i++ )); do echo -n "$horiz_line"; done
echo "$top_right_corner"

# Draw the sides
for (( j = 0; j < inner_height; j++ )); do
    print_indent $left_indent
    echo -n "$vert_line"
    printf '%*s' $inner_width
    echo "$vert_line"
done

# Draw the bottom border
print_indent $left_indent
echo -n "$bottom_left_corner"
for (( i = 0; i < inner_width; i++ )); do echo -n "$horiz_line"; done
echo "$bottom_right_corner"

# Draw the bottom indent
for (( i = 0; i < bottom_indent; i++ )); do
    echo
done

