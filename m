Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4113C1909AB
	for <lists+linux-clk@lfdr.de>; Tue, 24 Mar 2020 10:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgCXJl7 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 24 Mar 2020 05:41:59 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:60531 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgCXJl7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Mar 2020 05:41:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7881B5800A6;
        Tue, 24 Mar 2020 05:41:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 24 Mar 2020 05:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=24txCQ3MzrRDdJAn5seH/+jgUQ2
        W/ceh35pzhCWVaDQ=; b=yvf2geMYA6cfYPhXYsY/bd8hVAoNXgASYNj4WDFBuK5
        P8D+nGFh6AkcEIZ4cnnqENaCTrfqF484ScMJjBZgCbKGo2pJnf6B0wE00Xxrvken
        lHTn9cbHWcIrtafIR9zZqt/0l1isifb26duxQDpEyP1AeQRN9fvwUqWWnGPx8jb5
        F1MK3Xqpk34EQfFP+ROYsaMwO7SCTgcnESLI2AbCL/V0Q0Fbc7/pGFsTL3CmEMi1
        7g3fdQwiU2CXa7XYMartaol8tOHeXnWDNoFcgjqGTXZ2pMPM8adWRNzvt4lZ/1md
        TzS5apCjVkRymKyBjirwgTko+thP1ENg2YcbUztXCYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=24txCQ
        3MzrRDdJAn5seH/+jgUQ2W/ceh35pzhCWVaDQ=; b=0RCQYC8iy8UM4+k/7jJ+YF
        78qClmiPnIlnIlbq7Ipc7hOE8fX/yF3RdFvjux+qyf6Mn3uHNOqM2TwF0HP/k2rd
        Cz6VqP7w04peR1ShcEMbbVhjF8ymJuv2zW7stkxihLlZUzIy0WU3WytA/tupJUfG
        6nHAvzAOoIApuCSHRoaxj2P0D5axceQ4D3ZlEGzoxlw1MaUv7Ih5DfDLdJu/mXEP
        d47pZRrIAPeLrubrPEtdLPITfYCdXU6hjBDfCgSVhrq80blxg82P+0aU9WYZDo4V
        0ajlT26+uA8ZY2rsmExHpzifzVCAiJPg+b13tDozK1LqDyEIOLIbIBGzQ69ygv4w
        ==
X-ME-Sender: <xms:4dV5XmefbF7VfjFzJVosBl_axDPNuDJL41CD0o5yLVd_W-N6Q7gPUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehtddgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:4dV5XsNmIvFdaFlIabyIjKB07fHra4pP9b1wXcfLKJR023MjaC6NnA>
    <xmx:4dV5XptDgOyssOL2ikR50zx5ESDANs3AqM_1gS6BGcmh-SB0_Xm8nw>
    <xmx:4dV5XlDr8d5byLaaQklt8leuXEVO5qy4Mlna5dEvtfBB1JTs3mTIKg>
    <xmx:5dV5Xi1D5alf78oH8Hpt1TgbvIa4RD4WGvVPXyH4FI8MEGKvQNiVmQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 1393B328005E;
        Tue, 24 Mar 2020 05:41:53 -0400 (EDT)
Date:   Tue, 24 Mar 2020 10:41:51 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Chen-Yu Tsai <wens@csie.org>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] serial: 8250_dw: Fix common clocks usage race
 condition
Message-ID: <20200324094151.jvfywmpvx6k4se37@gilmour.lan>
References: <20200306130231.05BBC8030795@mail.baikalelectronics.ru>
 <20200323024611.16039-1-Sergey.Semin@baikalelectronics.ru>
 <20200323100109.k2gckdyneyzo23fb@gilmour.lan>
 <20200323135017.4vi5nwam2rlpepgn@ubsrv2.baikal.int>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sr5a2bfouaip4uok"
Content-Disposition: inline
In-Reply-To: <20200323135017.4vi5nwam2rlpepgn@ubsrv2.baikal.int>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--sr5a2bfouaip4uok
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2020 at 04:50:17PM +0300, Sergey Semin wrote:
> On Mon, Mar 23, 2020 at 11:01:09AM +0100, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Mar 23, 2020 at 05:46:09AM +0300, Sergey.Semin@baikalelectronics.ru wrote:
> > > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > >
> > > There are races possible in the dw8250_set_termios() callback method
> > > and while the device is in PM suspend state. A race condition may
> > > happen if the baudrate clock source device is shared with some other
> > > device (in our machine it's another DW UART port). In this case if that
> > > device changes the clock rate while serial console is using it the
> > > DW 8250 UART port might not only end up with an invalid uartclk value
> > > saved, but may also experience a distorted output data since baud-clock
> > > could have been changed. In order to fix this lets enable an exclusive
> > > reference clock rate access in case if "baudclk" device is specified.
> > >
> > > So if some other device also acquires the rate exclusivity during the
> > > time of a DW UART 8250 port being opened, then DW UART 8250 driver
> > > won't be able to alter the baud-clock. It shall just use the available
> > > clock rate. Similarly another device also won't manage to change the
> > > rate at that time. If nothing else have the exclusive rate access
> > > acquired except DW UART 8250 driver, then the driver will be able to
> > > alter the rate as much as it needs to in accordance with the currently
> > > implemented logic.
> > >
> > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > > Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> > > Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> > > Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> > > Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> > > Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> > > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > > Cc: Paul Burton <paulburton@kernel.org>
> > > Cc: Ralf Baechle <ralf@linux-mips.org>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > CC: Ray Jui <rjui@broadcom.com>
> > > Cc: Scott Branden <sbranden@broadcom.com>
> > > Cc: Florian Fainelli <f.fainelli@gmail.com>
> > > Cc: Wei Xu <xuwei5@hisilicon.com>
> > > Cc: Jason Cooper <jason@lakedaemon.net>
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Gregory Clement <gregory.clement@bootlin.com>
> > > Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > > Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Russell King <linux@armlinux.org.uk>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > Cc: Michael Turquette <mturquette@baylibre.com>
> > > Cc: Stephen Boyd <sboyd@kernel.org>
> > > Cc: linux-clk@vger.kernel.org
> > >
> > > ---
> > >
> > > Changelog v2:
> > > - Move exclusive ref clock lock/unlock precudures to the 8250 port
> > >   startup/shutdown methods.
> > > - The changelog message has also been slightly modified due to the
> > >   alteration.
> > > - Remove Alexey' SoB tag.
> > > - Cc someone from ARM who might be concerned regarding this change.
> > > - Cc someone from Clocks Framework to get their comments on this patch.
> > > ---
> > >  drivers/tty/serial/8250/8250_dw.c | 36 +++++++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > >
> > > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
> > > index aab3cccc6789..08f3f745ed54 100644
> > > --- a/drivers/tty/serial/8250/8250_dw.c
> > > +++ b/drivers/tty/serial/8250/8250_dw.c
> > > @@ -319,6 +319,40 @@ static void dw8250_set_ldisc(struct uart_port *p, struct ktermios *termios)
> > >  	serial8250_do_set_ldisc(p, termios);
> > >  }
> > >
> > > +static int dw8250_startup(struct uart_port *p)
> > > +{
> > > +	struct dw8250_data *d = to_dw8250_data(p->private_data);
> > > +
> > > +	/*
> > > +	 * Some platforms may provide a reference clock shared between several
> > > +	 * devices. In this case before using the serial port first we have to
> > > +	 * make sure nothing will change the rate behind our back and second
> > > +	 * the tty/serial subsystem knows the actual reference clock rate of
> > > +	 * the port.
> > > +	 */
> > > +	if (clk_rate_exclusive_get(d->clk)) {
> > > +		dev_warn(p->dev, "Couldn't lock the clock rate\n");
> > > +	} else if (d->clk) {
> > > +		p->uartclk = clk_get_rate(d->clk);
> > > +		if (!p->uartclk) {
> > > +			clk_rate_exclusive_put(d->clk);
> > > +			dev_err(p->dev, "Clock rate not defined\n");
> > > +			return -EINVAL;
> > > +		}
> > > +	}
> > > +
> > > +	return serial8250_do_startup(p);
> > > +}
> >
> > I've been facing that issue, so it would be great to get it fixed, but
> > I'm not sure this is the right solution.
> >
> > clk_rate_exclusive_get is pretty intrusive, and due to the usual
> > topology of clock trees, this will lock down 3-4 parent clocks to
> > their current rate as well. In the Allwinner SoCs case for example,
> > this will lock down the same PLL than the one used by the CPU,
> > preventing cpufreq from running.
> >
>
> Speaking about weak design of a SoC' clock tree. Our problems are nothing
> with respect to the Allwinner SoC, in which case of changing the
> CPU-frequency may cause the UART glitches subsequently causing data
> transfer artefacts.)

I just remembered the RPi3/4 are in this situation too.

> Moreover as I can see the same issue may raise for I2C, QSPI, PWM
> devices there.

We also have the I2C on the same parent clock in the Allwinner SoCs
indeed :)

> Anyway your concern does make sense.
>
> > However, the 8250 has a pretty wide range of dividers and can adapt to
> > any reasonable parent clock rate, so we don't really need to lock the
> > rate either, we can simply react to a parent clock rate change using
> > the clock notifiers, just like the SiFive UART is doing.
> >
> > I tried to do that, but given that I don't really have an extensive
> > knowledge of the 8250, I couldn't find a way to stop the TX of chars
> > while we change the clock rate. I'm not sure if this is a big deal or
> > not, the SiFive UART doesn't seem to care.
>
> Yes, your solution is also possible, but even in case of stopping Tx/Rx it
> doesn't lack drawbacks. First of all AFAIK there is no easy way to just
> pause the transfers. We'd have to first wait for the current transfers
> to be completed, then somehow lock the port usage (both Tx and Rx
> traffic), permit the reference clock rate change, accordingly adjust the
> UART clock divider, and finally unlock the port. While if we don't mind
> to occasionally have UART data glitches, we can just adjust the UART ref
> divider synchronously with ref clock rate change as you and SiFive UART
> driver suggest.
>
> So we are now at a zugzwang - a fork to three not that good solutions:
> 1) lock the whole clock branch and provide a glitchless interfaces. But
> by doing so we may (in case of Allwinner SoCs we will) lockup some very
> important functionality like CPU-frequency change while the UART port is
> started up. In this case we won't have the data glitches.

This solution, at least without a whitelist of platforms where it
makes sense, would be NAK'd for me. And I'm strongly suspecting that
that whitelist would be very short, so the overall usefulness is
pretty limited.

Maxime

--sr5a2bfouaip4uok
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXnnV3wAKCRDj7w1vZxhR
xUADAP0T4+rNUTmIr449WqZokRsvqclFFZ/WLllK7Jintt2IlAEA7Q/V14kEc8Sd
PcNC61hAFVGyFV/cQy1CT7nGqtgN3g8=
=mlSC
-----END PGP SIGNATURE-----

--sr5a2bfouaip4uok--
