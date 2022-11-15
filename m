Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7EC629CFF
	for <lists+linux-clk@lfdr.de>; Tue, 15 Nov 2022 16:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiKOPJ1 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 15 Nov 2022 10:09:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiKOPJZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Nov 2022 10:09:25 -0500
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 630037664;
        Tue, 15 Nov 2022 07:09:21 -0800 (PST)
Received: (Authenticated sender: herve.codina@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 47A9AC0006;
        Tue, 15 Nov 2022 15:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1668524960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=52nZTyzLtyLE0oMbZMuPmwJjms8J7lFPa4BIfaCMGt8=;
        b=Qdgpyqb++6k8h2Ul3v4+WDXeTugffLUG8/ox2YuZ9jkQakjENUumrptpRObBjztTwMiSJW
        /UktSqmj/blsk2CPlU645Te7QzJWC6T/KO+gusI8l9yE0SYLzDMW7WGWFIJ2HKPe70u7KJ
        7IjpyUTnISrtXARiMfZ97to3FiW9zSosv8CnXeu8bwUgH5b0qzQCzOa/T6a1pZrHdEQ56Q
        yir514nkITii/3WblZTLcb39qjCoU+juEipCLiP2wgbdqlYYkvb5nZk54mxAYCWRV7h6Ka
        SR/3hWaW52GXwRzFGCF2ZUDZ81kOeOG1qG98I/gIW1MxVWHorJFgGMFBRPv5GQ==
Date:   Tue, 15 Nov 2022 16:09:17 +0100
From:   Herve Codina <herve.codina@bootlin.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 6/7] ARM: dts: r9a06g032: Add the USBF controller
 node
Message-ID: <20221115160917.73e7b4ef@bootlin.com>
In-Reply-To: <20221115142754.6253881b@bootlin.com>
References: <20221114111513.1436165-1-herve.codina@bootlin.com>
        <20221114111513.1436165-7-herve.codina@bootlin.com>
        <51d42fc2-0492-9077-302d-5c3be4b45cd1@linaro.org>
        <20221115142754.6253881b@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof

On Tue, 15 Nov 2022 14:27:54 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi Krzysztof,
>=20
> On Tue, 15 Nov 2022 14:16:27 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>=20
> > On 14/11/2022 12:15, Herve Codina wrote: =20
> > > Add the USBF controller available in the r9a06g032 SoC.
> > >=20
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > ---
> > >  arch/arm/boot/dts/r9a06g032.dtsi | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >=20
> > > diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a=
06g032.dtsi
> > > index 563024c9a4ae..a4bb069457a3 100644
> > > --- a/arch/arm/boot/dts/r9a06g032.dtsi
> > > +++ b/arch/arm/boot/dts/r9a06g032.dtsi
> > > @@ -117,6 +117,18 @@ dmamux: dma-router@a0 {
> > >  			};
> > >  		};
> > > =20
> > > +		udc: usb@4001e000 {
> > > +			compatible =3D "renesas,r9a06g032-usbf", "renesas,rzn1-usbf";
> > > +			reg =3D <0x4001e000 0x2000>;
> > > +			interrupts =3D <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
> > > +				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
> > > +			clocks =3D <&sysctrl R9A06G032_HCLK_USBF>,
> > > +				 <&sysctrl R9A06G032_HCLK_USBPM>;
> > > +			clock-names =3D "hclkf", "hclkpm";
> > > +			power-domains =3D <&sysctrl>;
> > > +			status =3D "disabled";   =20
> >=20
> > If you provided all resources (clocks, power domains etc), why disablin=
g it? =20
>=20
> Because I forgot to remove the 'status' property ...
> 'status' will be simply removed in v3.
> Sorry for this mistake.
>=20
> Thanks for the review,
> Herv=C3=A9
>=20

I said something completely wrong for this point.

status is set disabled because it is a .dtsi and can be
included by several dts to represent a board.
This node (USB device) can be wired on some board and not on
some others.
So, the node will be enabled in each dts board that has the USBF
device wired and used.

Herv=C3=A9

--=20
Herv=C3=A9 Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
