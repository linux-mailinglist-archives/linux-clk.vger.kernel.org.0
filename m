Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CED84C9340
	for <lists+linux-clk@lfdr.de>; Tue,  1 Mar 2022 19:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbiCAS3h (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 1 Mar 2022 13:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236980AbiCAS31 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 1 Mar 2022 13:29:27 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC5D2D1E9
        for <linux-clk@vger.kernel.org>; Tue,  1 Mar 2022 10:28:42 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hw13so33176047ejc.9
        for <linux-clk@vger.kernel.org>; Tue, 01 Mar 2022 10:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HM+beLJHiEhVyvh+HkFPpcRCDQIPbHmuWlZOoIbiTX8=;
        b=Q0CVZoq3v257bloStpuRcWLoDjcKgGxC5u3V0pKTPG+WuEFe5+dZJD3JFi6yf7UBXZ
         lvvAs3IWrm3xw4l0LxSZ3XMeB9DGbYT2ocFTEn/KKYsULVh8WI1JNRpCwx3v1U+KlqSZ
         letVeYVASZ53E9OTOzHXogTq6GS8Gk5Hs0jkssnonfkeJ38sa0ocIYX/gOjPQJN6lmg1
         engTCoMF/7Z7+etLHegNPGq/TkhMWRCFCOUunQHa3inGFIUFvYztr7H7Nc2YPc32vCny
         kSrDF9NFhl9p489Mf6agqNApSvjEHQZA0yvPMAcXqbc925tu4VRywB36zTOW8Lo8bMkv
         HGww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HM+beLJHiEhVyvh+HkFPpcRCDQIPbHmuWlZOoIbiTX8=;
        b=YUfVzgrNFAnMjYpQW6y68ZU961zpsSCAsfZq9iQ8wA8DcrCsxgc5PdAkt8+pWTjkGU
         oCyqLzAsueh76VpwPcZRDL4ZboXkvMAFYTX3XpCtD1c82kCZjLeLkmc/Ov9ctzmCsJ5e
         FN6iW1RBK9c/YugTTx8ZNhaPMTtx6V26vsH1wWpHGxonCnvia77mI4AQjF8UWSl7lKQP
         xLocAOCMEZ96EOxB2tNAV/DUpJRxlSF9ksYWhzD8YwceBrqLXvid6Vs+LNSubvgGivwz
         t466KsXxjowgGygIUHTWYwMonrrvoNHdsT3nh020ZngUfsgvcTG2nsiATOQIp4EGGW/B
         jFaA==
X-Gm-Message-State: AOAM532UNflJ10zo/UFIhNuZtnkjimp4ZLAjzbhz5GiOQSIlC1LSHwWw
        rszyHdBTcMW2MYEA8cXq7+IpqY2WNfj/v2MiofkMz6Wk2zw=
X-Google-Smtp-Source: ABdhPJwEfP/aIPO2HEihPajV/KsvbRXRz/rA/ZtGz7wffvsI73JikqXcl934S8+1djsQXk57ZXC+QVmvP/98mLa3ZIY=
X-Received: by 2002:a17:907:6006:b0:6cd:efc0:3d67 with SMTP id
 fs6-20020a170907600600b006cdefc03d67mr20205984ejc.32.1646159320239; Tue, 01
 Mar 2022 10:28:40 -0800 (PST)
MIME-Version: 1.0
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
 <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com> <CAHCN7xKVMCC_Sgqp_Dgpwyi4X4rq4qKi2MheA_CK1vcrm3JjyA@mail.gmail.com>
 <b15f993b-d67b-b96a-904c-53025eda3aa3@lucaceresoli.net> <MN2PR03MB5008747FDF505CA30970ADE293029@MN2PR03MB5008.namprd03.prod.outlook.com>
 <CAHCN7x+kusPwHpkp+4zwvGN48oDUGfN2ueCn=8kt_54aiYwE9g@mail.gmail.com> <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
In-Reply-To: <MN2PR03MB5008F4921D8484306505F8FB93029@MN2PR03MB5008.namprd03.prod.outlook.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 1 Mar 2022 12:28:28 -0600
Message-ID: <CAHCN7xKbE9Rv3EsvFkS4Lk8nCwy1TK-xJQLk_h70PSVdeUHJcA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
 versaclock5 driver
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Sean Anderson <sean.anderson@seco.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 1, 2022 at 12:16 PM Fillion, Claude
<Claude.Fillion@mksinst.com> wrote:
>
>
> > -----Original Message-----
> > From: Adam Ford <aford173@gmail.com>
> > Sent: Tuesday, March 1, 2022 9:30 AM
> > To: Fillion, Claude <Claude.Fillion@mksinst.com>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>; Sean Anderson
> > <sean.anderson@seco.com>; linux-clk <linux-clk@vger.kernel.org>
> > Subject: Re: [EXTERNAL] Re: Questions regarding regarding idt/renesas
> > versaclock5 driver
> >
> > On Tue, Mar 1, 2022 at 8:12 AM Fillion, Claude <Claude.Fillion@mksinst.=
com>
> > wrote:
> > >
> > > Thanks for your replies.  A few more points/questions.
> > >
> > >
> > >
> > > > -----Original Message-----
> > >
> > > > From: Luca Ceresoli <luca@lucaceresoli.net>
> > >
> > > > Sent: Monday, February 28, 2022 5:14 PM
> > >
> > > > To: Adam Ford <aford173@gmail.com>; Sean Anderson
> > >
> > > > <sean.anderson@seco.com>
> > >
> > > > Cc: Fillion, Claude <Claude.Fillion@mksinst.com>; linux-clk <linux-
> > >
> > > > clk@vger.kernel.org>
> > >
> > > > Subject: [EXTERNAL] Re: Questions regarding regarding idt/renesas
> > >
> > > > versaclock5 driver
> > >
> > > >
> > >
> > > > This email originated outside of MKS.  Use caution when sharing
> > > > information
> > >
> > > > or opening attachments and links.
> > >
> > > >
> > >
> > > > -------------------------------------------------------------------=
-
> > > > --------------------------
> > >
> > > > ----------------------------------------------
> > >
> > > > Hi,
> > >
> > > >
> > >
> > > > On 28/02/22 18:06, Adam Ford wrote:
> > >
> > > > > On Mon, Feb 28, 2022 at 10:04 AM Sean Anderson
> > >
> > > > <sean.anderson@seco.com> wrote:
> > >
> > > > >>
> > >
> > > > >>
> > >
> > > > >>
> > >
> > > > >> On 2/28/22 7:35 AM, Fillion, Claude wrote:
> > >
> > > > >>>
> > >
> > > > >>> You don't often get email from claude.fillion@mksinst.com. Lear=
n
> > > > >>> why
> > >
> > > > >>> this is important
> > >
> > > > >>>
> > >
> > > >
> > <https://urldefense.com/v3/__http://aka.ms/LearnAboutSenderIdentific
> > >
> > > > >>> ation__;!!KnJ4-
> > >
> > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-We
> > >
> > > > >>> UZR3sOMdn4NpYPGkfDG$ >
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>> Hello  Sean,
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >
> > >
> > > > > + Luca Ceresoli
> > >
> > > > >
> > >
> > > > >>>
> > >
> > > > >>> I have a design that is looking to use the Renesas 5P49V6965 or
> > > > >>> 5P49V690
> > >
> > > > clock chip and am looking to use the versaclock 5 driver
> > >
> > > > (https://urldefense.com/v3/__https://github.com/Xilinx/linux-
> > >
> > > > xlnx/blob/master/drivers/clk/clk-versaclock5.c__;!!KnJ4-
> > >
> > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
> > >
> > > > WeUZR3sOMdn4NpaBSRqIM$ ).
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>> I am new to writing drivers and have two questions I am hoping
> > > > >>> you can
> > >
> > > > help me with:
> > >
> > > > >>>
> > >
> > > > >>> 1) In the driver I see the following code:
> > >
> > > > >>>
> > >
> > > > >>> static const struct vc5_chip_info idt_5p49v6901_info =3D {
> > >
> > > > >>>
> > >
> > > > >>>             .model =3D IDT_VC6_5P49V6901,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_fod_cnt =3D 4,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_out_cnt =3D 5,
> > >
> > > > >>>
> > >
> > > > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL,
> > >
> > > > >>>
> > >
> > > > >>> };
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
> > >
> > > > >>>
> > >
> > > > >>>             .model =3D IDT_VC6_5P49V6965,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_fod_cnt =3D 4,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_out_cnt =3D 5,
> > >
> > > > >>>
> > >
> > > > >>>             .flags =3D  VC5_HAS_BYPASS_SYNC_BIT,
> > >
> > > > >>>
> > >
> > > > >>> };
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>> However, the 6965 part also has the same frequency doubling bit
> > > > >>> as the
> > >
> > > > 6901.  Would it be better to set the flags for the 6965 to somethin=
g like
> > this?
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>>
> > >
> > > > >>> static const struct vc5_chip_info idt_5p49v6965_info =3D {
> > >
> > > > >>>
> > >
> > > > >>>             .model =3D IDT_VC6_5P49V6965,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_fod_cnt =3D 4,
> > >
> > > > >>>
> > >
> > > > >>>             .clk_out_cnt =3D 5,
> > >
> > > > >>>
> > >
> > > > >>>             .flags =3D VC5_HAS_PFD_FREQ_DBL |
> > > > >>> VC5_HAS_BYPASS_SYNC_BIT,
> > >
> > > > >>>
> > >
> > > > >>> };
> > >
> > > > >>
> > >
> > > > >> I think Adam will have a better idea about this.
> > >
> > > > >>
> > >
> > > > >>> 2) I am unclear how to set the output frequencies for the
> > > > >>> device. For my
> > >
> > > > application I would like to set output clock 1 to 250MHz and output
> > > > clock 2 to
> > >
> > > > 46.8MHz but I am unclear how to do so.  I have looked at the
> > > > documentation
> > >
> > > > at
> > >
> > > >
> > https://urldefense.com/v3/__https://mjmwired.net/kernel/Documentatio
> > > > n
> > >
> > > > /devicetree/bindings/clock/idt,versaclock5.yaml__;!!KnJ4-
> > >
> > > > rp7!1bH43_JT7scsjwzrGD8lPeXvlXh9WieG2jadu9NICLiUrW-
> > >
> > > > WeUZR3sOMdn4NpVQVg6al$  but remain unclear how to set the output
> > >
> > > > frequencies.  Any insight you could provide would be greatly apprec=
iated.
> > >
> > > > >>
> > >
> > > > >> Use assigned-clock-frequencies as described in
> > >
> > > > >> Documentation/devicetree/bindings/clock/clock-bindings.txt
> > >
> > > > >>
> > >
> > > > >
> > >
> > > > > I agree that the clock-bindings have the instructions on how to
> > > > > set
> > >
> > > > > them.  If you check
> > >
> > > > > arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi, there are
> > > > > some
> > >
> > > > > examples of how to set the frequency.
> > >
> > > > > In my instance,  the chip wasn't enabling the output by default,
> > > > > so I
> > >
> > > > > needed to submit some patches upstream to make sure the device
> > > > > that
> > >
> > > > > was being clocked by this device had get and enable functions to
> > > > > make
> > >
> > > > > sure the clock chip would turn on the clock when requested.
> > >
> > > >
> > >
> > > > Indeed assigned-clocks is the way to enable a clock when the
> > > > downstream
> > >
> > > > driver does not request it. Not that it is easy to find: it took me
> > > > a while to find
> > >
> > > > it the first time I needed it.
> > >
> > > >
> > >
> > >
> > >
> > > Trying to follow the example beacon-renesom-som.dtsi implementation
> > but am still not getting proper output.  I should note I am running thi=
s as a
> > patch on an older Petalinux  code base (4.14.0-xilinx-v2018.3). After r=
eplacing
> > dev_err_probe() calls with older dev_err() calls the code compiles and =
seems
> > to run without issue. Is it possible other files need to be updated?
> > >
> > >
> > >
> > > Added the provider code at the beginning of dtsi as follows;
> > >
> > > #include <dt-bindings/clk/versaclock.h>
> > >
> > >
> > >
> > > /include/ "system-conf.dtsi"
> > >
> > > / {
> > >
> > >   /* Clock Provider */
> > >
> > >   x304_clk: x304-clock {
> > >
> > >     compatible =3D "fixed-clock";
> > >
> > >     #clock-cells =3D <0>;
> > >
> > >     clock-frequency =3D <25000000>;
> > >
> > >   };
> > >
> > > =E2=80=A6
> > >
> > >
> > >
> > > And added consumer code:
> > >
> > >
> > >
> > > &i2c1 {
> > >
> > >     clock-frequency =3D <100000>;
> > >
> > >
> > >
> > >     // Use patch.  Updated driver for 5p49v6965 available  at
> > > https://urldefense.com/v3/__https://github.com/Xilinx/linux-xlnx/blob=
/
> > > master/drivers/clk/clk-versaclock5.c__;!!KnJ4-rp7!3K4sRtgFBeaZQ8IrEvZ=
8
> > > dkvJDiPMBlDRradrS0adfnpa1dNXMNjeIwNfOyHPLkFkwVpJ$
> > >
> > >     // Device Tree Setup ->
> > > https://urldefense.com/v3/__https://github.com/Xilinx/linux-xlnx/blob=
/
> > >
> > master/Documentation/devicetree/bindings/clock/idt*2Cversaclock5.yaml_
> > > _;JQ!!KnJ4-
> > rp7!3K4sRtgFBeaZQ8IrEvZ8dkvJDiPMBlDRradrS0adfnpa1dNXMNjeIwN
> > > fOyHPLhF0Uums$
> > >
> > >     versaclock6: clock-controller@6a {
> > >
> > >         /* Clock Consumer */
> > >
> > >         compatible =3D "idt,5p49v6965";
> > >
> > >                                 reg =3D <0x6a>;
> > >
> > >                                 #clock-cells =3D <1>;
> > >
> > >                                 clocks =3D <&x304_clk>;
> > >
> > >                                 clock-names =3D "xin";
> > >
> > >
> > >
> > >         assigned_clocks =3D <&versaclock6 1>,
> > >
> > >                           <&versaclock6 2>,
> > >
> > >                           <&versaclock6 3>,
> > >
> > >                           <&versaclock6 4>;
> > >
> > >         assigned_clock_rates =3D <46800000>, <250000000>, <1000000>,
> > > <13000000>;
> >
> >
> > Assigned clocks and assigned clock rates should be hyphens and not
> > underscores.
> >
> > assigned-clocks =3D  <&versaclock6 1>,   <&versaclock6 2>,
> > <&versaclock6 3>, <&versaclock6 4>;
> >
> > assigned-clock-rates =3D  <46800000>, <250000000>, <1000000>, <13000000=
>;
> >
> > Another thing to check is to make sure the consumers of these clocks is
> > enabling them.  They do not necessarily get enabled by default.
> >
> > adam
>
> Doh - thanks.  I looked at it a million times =F0=9F=98=8A .
>
> Now getting desired out1 frequency but nothing on other outputs.  From th=
e code it seems vc5_clk_out_prepare() is the method that enables outputs bu=
t this method is not being called I am not clear how to make the 'consumer =
enable them.'
>
> I have added this to my dtsi to no avail.
>
>          /* Consumer referencing 5P49V5965 pin OUT1 and OUT2 */
>         consumer {
>             clocks =3D <&versaclock6 1>, <&versaclock6 2>;
>             /* ... */
>          };
>
> Looking through device tree documentation.

It's likely going to be in the consumer's driver.  Check the consumer
device tree binding to make sure you've correctly associated the
clock.  If the binding doesnt't show a clock is required, it might not
know that you using a programmable clock.

Here is a patch that I needed to apply to an Ethernet driver which
wasn't expecting a programmable clock to drive a reference clock, so
the clock wasn't being enabled.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/net/ethernet/renesas/ravb_main.c?id=3D8ef7adc6beb2ef0bce83513dc9e450=
5e7b21e8c2

Look at the use of devm_clk_get_optional and clk_prepare_enable from
that patch.  (yes, there is a subsequent patch that fixes something I
didn't quite do right, but the basics are here)

The consumer drivers need to 'get' the clock so it can associate
itself to the clock in question.  Once the relationship is
established, the consumer needs to call clk_prepare_enable() which
uses the clock system to turn the clock on.  Without this step, it's
likely the Versaclock won't generate a signal, because it doesn't know
it needs to turn it on.

adam
>
> >
> >
> >
> > >
> > >         /* Set the SD/OE pin's settings */
> > >
> > >         OUT1 {
> > >
> > >             idt,mode =3D <VC5_LVDS>;
> > >
> > >             idt,voltage-microvolt =3D <3300000>;
> > >
> > >             idt,slew-percent =3D <100>;
> > >
> > >         };
> > >
> > >         OUT2 {
> > >
> > >             idt,mode =3D <VC5_LVDS>;
> > >
> > >             idt,voltage-microvolt =3D <3300000>;
> > >
> > >             idt,slew-percent =3D <100>;
> > >
> > >         };
> > >
> > >         OUT3 {
> > >
> > >             idt,mode =3D <VC5_LVDS>;
> > >
> > >             idt,voltage-microvolt =3D <3300000>;
> > >
> > >             idt,slew-percent =3D <100>;
> > >
> > >         };
> > >
> > >         OUT4 {
> > >
> > >             idt,mode =3D <VC5_LVDS>;
> > >
> > >             idt,voltage-microvolt =3D <3300000>;
> > >
> > >             idt,slew-percent =3D <100>;
> > >
> > >         };
> > >
> > >     };
> > >
> > > =E2=80=A6
> > >
> > >
> > >
> > > But still only seeing default clocks (100MHz on out 1, nothing on out=
2-4).
> > >
> > >
> > >
> > > Any suggestions?
> > >
> > >
> > >
> > > > >>> I saw your name mentioned so I am emailing  you directly.  If
> > > > >>> there is a
> > >
> > > > better place to ask these questions can you please direct me there?
> > > > Thanks
> > >
> > > > you so much.
> > >
> > > > >>
> > >
> > > > >> Adam (CC'd) wrote the original driver, so he's probably a better
> > >
> > > > >> person to start with. You should also CC the linux-clk mailing
> > > > >> list
> > >
> > > > >> for questions about clock drivers.
> > >
> > > > >
> > >
> > > > > I've reviewed the datasheet for the 6965, and it doesn't
> > > > > explicitly
> > >
> > > > > show the multiplier, but the programmer's guide does appear to
> > > > > show
> > >
> > > > > the existence of bit that when set, it will "double the reference
> > >
> > > > > frequency for the Phase frequency detector" but on the
> > > > > programmer's
> > >
> > > > > guide for the 6901, the same bit reads "Enables frequency doubler
> > > > > when
> > >
> > > > > set to 1" so it's not clear to me that these functions are exactl=
y
> > > > > the
> > >
> > > > > same, but implies that it might be.  I'll need some time to test
> > > > > this,
> > >
> > > > > but if I find it works, I can push a patch to this driver.  I
> > > > > added
> > >
> > > > > Luca, as he is the maintainer for this driver as well.
> > >
> > > >
> > >
> > > > Thanks Adam. I'm afraid I have no detailed answer as I never tried
> > > > this bit,
> > >
> > > > but according to the docs indeed it looks like there is a doubler a=
s
> > > > you
> > >
> > > > noticed, that it is disabled by default. It would be nice to test i=
t
> > > > and submit a
> > >
> > > > patch, thanks!
> > >
> > > >
> > >
> > > > --
> > >
> > > > Luca
> > >
> > >
> > >
> > > For what it's worth, I have played around with Renesas' Timing Comman=
der
> > tool and they seem to use the doubler bit in the same fashion.
> > >
> > >
> > >
> > >
> > >
> > > Thanks,
> > >
> > > Claude
> > >
> > > ________________________________
> > > This message and any attachments are intended only for the designated
> > recipient(s) and may contain confidential or proprietary information an=
d be
> > subject to the attorney-client privilege or other confidentiality prote=
ctions. If
> > you are not a designated recipient, you may not review, use, copy or
> > distribute this message or any attachments. If you received this email =
in
> > error, please notify the sender by reply e-mail and permanently delete =
the
> > original and any copies of this message and any attachments thereto. Th=
ank
> > you.
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This message and any attachments are intended only for the designated rec=
ipient(s) and may contain confidential or proprietary information and be su=
bject to the attorney-client privilege or other confidentiality protections=
.  If you are not a designated recipient, you may not review, use, copy or =
distribute this message or any attachments.  If you received this email in =
error, please notify the sender by reply e-mail and permanently delete the =
original and any copies of this message and any attachments thereto.  Thank=
 you.
