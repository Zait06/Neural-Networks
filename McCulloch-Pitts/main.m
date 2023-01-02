clear

mc = McCullochPitts(0, 0);
op = 0;
while (true)
  clc
  disp('McCulloch-Pitts')
  fprintf('Select the logic operation:\n1. NOT\n2. AND\n3. OR\n')
  % Select option
  op = input('Write your option: ');
  if (op > 0 & op < 4)
    break
  endif
  disp("Select an option from menu")
  pause
endwhile

switch (op)
  case 1
    disp("Logical NOT")
  case 2
    disp("Logical AND")
  case 3
    disp("Logical OR")
endswitch

while (true)
  clc
  if op ~= 1
    size_ = input('Size number to outputs (min 2): ');
    if (size_ < 2)
      size_ = 2;
    endif
    for i = 1:size_
      fprintf('Input w_%d',i);
      w(i)=input(': ');
    end
  else
    w = input('Input w: ');
  endif
  u = input('Input theta: ');

  mc = set_weights(mc, w);
  mc = set_theta(mc, u);

  success = logical(0);
  switch (op)
    case 1
      success = not(mc);
    case 2
      success = and(mc, size_);
    case 3
      success = or(mc, size_);
  endswitch

  if success
    disp("Cellule learned correctly. To continue, press enter...");
    pause
    break
  else
    fprintf("Error, do you wanna try again?\n1.Yes\t2.No")
    answ = input('Option: ');
    if answ == 2
      break
    endif
  endif
endwhile

disp("Do you wanna save weights and theta value?\n1.Yes\t2.No")
answ = input('Option: ');
if answ == 1
  mc.save(mc)
endif

disp("Finish program")