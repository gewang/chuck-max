# chuck-max

Ongoing project to 'embed [chuck](https://chuck.stanford.edu) in a Max/Msp external.

Currently can only output sound (processing external sound still not working!)

## Compilation

Note that this external is currently only developed and tested on macOS. All dependencies are included in the repo, and it the external is built 'statically' without any non-system dependencies.

```bash
make
make setup
```

Note: `make setup` does the following:

```bash
ln -s $(shell pwd) "$(HOME)/Documents/Max 8/Packages/$(shell basename `pwd`)"
```



## Usage

Open the help file for a demo.


## Status

- [ ] improve interface
- [ ] fix sound input!
- [x] fix sound output! Thanks [DBraun](https://github.com/DBraun)
- [x] initial attempt to embed (no sound yet) without compilation or max/msp errors
- [x] compiled `chuck~` with `libchuck.a` without errors
- [x] created `libchuck.a`
- [x] converted chuck makefile to CMAKE


## Credits

I was originally persuaded to try to get [Brad Garton's](http://sites.music.columbia.edu/brad) original [chuck~](http://sites.music.columbia.edu/brad/chuck~) external for Max 5 running, but I couldn't get it to work in more recent versions of Max.

Then I unsuccessfully attempted to create a new external against the latest Max and Chuck apis in the [pd-chuck](https://github.com/shakfu/pd-chuck) project.

In this last attempt, everything worked except audio: there was something challenging in getting Chuck to work with puredata's audio module which I couldn't solve. I asked for help on chuck's github issue tracker and received none. I asked for help in the chuck electro-music forum and received only one post which was appreciative of the effort but none too helpful. So, I left it for another day.

I'm not sure why I tried again with Max/MSP but it turned out to be a good idea because this time I just searched for prior art in Github, and found David Braun's excellent[ChucKDesigner](https://github.com/DBraun/ChucKDesigner) project which embeds chuck in a Touch Designer plugin.

David is a [CCRMA](https://github.com/CCRMA) (the home of chuck) alum and the author of the fantastic [DawDreamer](https://github.com/DBraun/DawDreamer) project which I am already a great fan of, and in this case, he was solving the same problem for Touch Designer that I was trying to solve for pd and Max/MSP. This made somewhat more confident that I would get closer to a solution to the audio issue...

So after looking for the `chuck->run` call in his code I found the following nugget:

```c++
// chuck->run(inbuffer, *output->channels, output->numSamples); // this doesn't work because of interleaved samples.
// Chuck returns LRLRLRLR but for touchdesigner we want LLLLRRRR.
// Therefore we must use an intermediate buffer
```

This was a big aha since it followed that it was likely that PD and Max/MSP, like TouchDesigner, require non-interleaved samples, so after about half an hour of retrofitting David's solution to this project's `perform64` function, I compiled and loaded the external in Max and it worked perfectly the first time!

So in summary, this project owes a big thanks to two people: Brad Garton, for inspiring me with the original `chuck~` external which demonstrated that it could be done, and for making his code available -- wich proved to be an invaluable guide on how this external should be implemented.

And finally, to David Braun, for creating and making public the code to ChucKDesigner which helped me solve the audio problem.

