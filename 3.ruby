arp_activated = true
arp2_activated = true
arp3_activated = true
pedal_activated = true

live_loop :tick do
  sleep 0.125
end


live_loop :arp do
  sync :tick
  if not arp_activated
    sleep 1
    
  else
    
    play (scale :e3, :minor_pentatonic).tick(:foo), release: 0.1, amp: 0.3
    sleep (ring 0.125, 0.25, 0.5).tick(:bar)
  end
end



live_loop :arp3 do
  sync :tick
  if not arp3_activated
    sleep 1
    
  else
    
    play (scale :e3, :minor_pentatonic).reverse().tick(:foo), release: 0.24,  amp: 0.3
    sleep (ring 0.25).tick(:bar)
  end
end

live_loop :arp2 do
  sync :tick
  if not arp2_activated
    sleep 1
  else
    
    play (scale :G4, :major).tick(:bar), release: 0.2,  amp: 0.3
    sleep (ring 0.125, 0.25).tick(:foo)
  end
  
end


live_loop :pedal do
  sync :tick
  if pedal_activated
    
    play :G2, release: 5,  amp: 0.4
    sleep 6
  else
    sleep 1
  end
end
