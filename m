Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB07D3B4540
	for <lists+linux-clk@lfdr.de>; Fri, 25 Jun 2021 16:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbhFYOMJ (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 25 Jun 2021 10:12:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42868 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229700AbhFYOMH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Jun 2021 10:12:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FBC761939;
        Fri, 25 Jun 2021 14:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624630186;
        bh=krA21i06ozFHCVF0ajrxOO3f2UbyiBHTfdoRHSdbhKo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sv4o+GWvusop1RLvOROZ/g/MKadgpC/8S6XgOIEi85bLmbpf+aLnlYDTKj6omG76S
         AocupaamFhnxtI37BaaXJRZrNBNzY3sHimAzRZ6Tx0fnU0e7IsQNapqM11A/s3PdB8
         PvZ2fBo+rCvHJt9CHWO94N6Q0INOhOClYYQ+JMg1Fd923J0cMe4Yvu32KZJeGSZbqM
         xOH0facSjkDTA8OAUhnqaT4uVbowSULMd/JnDpHtztXruZc8+4JYkp2cQrlRZiR5u1
         9F5sMiNlDZKRHEi0OlXFxtjRqw+tPq+fOH1EE4uRgjNTM+9SuZryDEYzjHra8RiSAP
         BEMk4wl3lK3nA==
Received: by pali.im (Postfix)
        id 956E560E; Fri, 25 Jun 2021 16:09:43 +0200 (CEST)
Date:   Fri, 25 Jun 2021 16:09:43 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     kernel test robot <lkp@intel.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kbuild-all@lists.01.org, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 07/10] serial: mvebu-uart: implement UART clock driver
 for configuring UART base clock
Message-ID: <20210625140943.hjvhklwg4s5z7ahi@pali>
References: <20210624224909.6350-8-pali@kernel.org>
 <202106251653.IbU5dy4V-lkp@intel.com>
 <20210625093131.aicap7ah5odokjvf@pali>
 <CAMuHMdWLu6gUk-Xc5YqBr-01AVGC_8RfdB+Nf3BmcA_wqk8TZQ@mail.gmail.com>
 <20210625112921.loyw6nmj6ld67lso@pali>
 <CAMuHMdUjCzEHHUO4mXrWLZUu-p1uFJqRZL5m7k0EwFCpq0GX=A@mail.gmail.com>
 <20210625132211.grax2ys445w3qahw@pali>
 <CAMuHMdUqhMGPdBcyWSZeZRiyDcnT2PRU1_md-jVcbZy-2=55yw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUqhMGPdBcyWSZeZRiyDcnT2PRU1_md-jVcbZy-2=55yw@mail.gmail.com>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Friday 25 June 2021 15:35:28 Geert Uytterhoeven wrote:
> Hi Pali,
> 
> On Fri, Jun 25, 2021 at 3:22 PM Pali Rohár <pali@kernel.org> wrote:
> > On Friday 25 June 2021 14:44:36 Geert Uytterhoeven wrote:
> > > On Fri, Jun 25, 2021 at 1:29 PM Pali Rohár <pali@kernel.org> wrote:
> > > > On Friday 25 June 2021 13:05:32 Geert Uytterhoeven wrote:
> > > > > On Fri, Jun 25, 2021 at 11:31 AM Pali Rohár <pali@kernel.org> wrote:
> > > > > > On Friday 25 June 2021 16:15:38 kernel test robot wrote:
> > > > > > > I love your patch! Yet something to improve:
> > > > > > >
> > > > > > > [auto build test ERROR on robh/for-next]
> > > > > > > [also build test ERROR on tty/tty-testing clk/clk-next linus/master v5.13-rc7 next-20210624]
> > > > > > > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > > > > > > And when submitting patch, we suggest to use '--base' as documented in
> > > > > > > https://git-scm.com/docs/git-format-patch]
> > > > > > >
> > > > > > > url:    https://github.com/0day-ci/linux/commits/Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > > > > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
> > > > > > > config: m68k-allmodconfig (attached as .config)
> > > > > > > compiler: m68k-linux-gcc (GCC) 9.3.0
> > > > > > > reproduce (this is a W=1 build):
> > > > > > >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> > > > > > >         chmod +x ~/bin/make.cross
> > > > > > >         # https://github.com/0day-ci/linux/commit/747483a6b8f2de98afe461dbf91227404a8e2e81
> > > > > > >         git remote add linux-review https://github.com/0day-ci/linux
> > > > > > >         git fetch --no-tags linux-review Pali-Roh-r/serial-mvebu-uart-Fixes-and-new-support-for-higher-baudrates/20210625-065146
> > > > > > >         git checkout 747483a6b8f2de98afe461dbf91227404a8e2e81
> > > > > > >         # save the attached .config to linux build tree
> > > > > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k
> > > > > > >
> > > > > > > If you fix the issue, kindly add following tag as appropriate
> > > > > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > > > >
> > > > > > > All errors (new ones prefixed by >>):
> > > > > > >
> > > > > > >    m68k-linux-ld: drivers/tty/serial/mvebu-uart.o: in function `mvebu_uart_clock_prepare':
> > > > > > >    mvebu-uart.c:(.text+0x6d0): undefined reference to `__udivdi3'
> > > > > > > >> m68k-linux-ld: mvebu-uart.c:(.text+0x78c): undefined reference to `__udivdi3'
> > > > > >
> > > > > > Hello! Could you help me how to fix this issue? I'm using macro
> > > > > > DIV_ROUND_CLOSEST() with two u64 values in that function. And I really
> > > > > > do not know details about m68k arch and I never touched this arch.
> > > > > >
> > > > > > There is missing number of line which caused this error. So if it is
> > > > > > possible I have suggestion for bot to compile kernel with -g flag. In
> > > > > > this case linker show exact line number (and not only hex address) which
> > > > > > caused that linker error. Also in future it could help identify source
> > > > > > of errors...
> > > > >
> > > > > This error means your driver uses a 64-bit division without using the
> > > > > proper methods from include/linux/math64.h.
> > > >
> > > > Ok. So whenever I need 64-bit division should I always use macros from
> > > > this header file and also in case my driver is only for 64-bit platform?
> > >
> > > Exactly. As SERIAL_MVEBU_UART depends on ARCH_MVEBU || COMPILE_TEST,
> > > it can be test-compiled on other architectures.
> > >
> > > > I see that in this header file is DIV64_U64_ROUND_CLOSEST() macro which
> > > > seems to be 64-bit forced variant of DIV_ROUND_CLOSEST() which I'm
> > > > using.
> > >
> > > Indeed.
> > >
> > > Please also consider if you really need to do a 64-bit division, and if a
> > > simpler and faster 64-by-32 division would be sufficient.
> >
> > Good catch! I have checked this and numerator in the worst case does not
> > fit into 32 bits (so u64 is needed) but denominator in the worst case
> > fits into unsigned 32 bit integer.
> 
> Note that in some cases, the numerator is (unsigned) long, hence sometimes
> 32-bit, sometimes 64-bit, and there are separate helpers for that.
> 
> > So what is the preferred way to do u64/u32 division with rounding to the
> > closest number which would work on all platforms?
> >
> > In the end I need to clamp this result into range 1..1023.
> 
> Without rounding, it is div_u64().
> With rounding, that would be DIV_U64_ROUND_CLOSEST(), which doesn't
> exist yet. So you have to add it first, cfr. DIV_S64_ROUND_CLOSEST().

Perfect, thank you very much for help.

I will send a new patch series version with introduction of
DIV_U64_ROUND_CLOSEST() macro in separate commit and then its usage in
this patch.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
