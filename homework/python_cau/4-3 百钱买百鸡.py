for weng in range(1,21):
    for mu in range(1,34):
        for chu in range(1,301):
            if weng*5+mu*3+chu/3==chu+mu+weng==100:
                print(weng,mu,chu)
            else:
                continue
