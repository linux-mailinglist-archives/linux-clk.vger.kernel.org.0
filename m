Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1703E54D254
	for <lists+linux-clk@lfdr.de>; Wed, 15 Jun 2022 22:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344979AbiFOUKc (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jun 2022 16:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbiFOUKb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 16:10:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC98F366A0;
        Wed, 15 Jun 2022 13:10:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5E7A9B82177;
        Wed, 15 Jun 2022 20:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCC3C3411A;
        Wed, 15 Jun 2022 20:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655323828;
        bh=NYkoR6VqQygQruoVCGPg7fQxquBBe2DAIYM/jQYHsfg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=W/jCa6hFgfFvdRNRccT5/vS5VEQsgQZqyRZyluBGuYIlkvQN8s+SYmffPB5zJNxd2
         5z/eYzE3ApEu0a4c4cU2XZVOY5lYVdB/AGdEBZtKgM91id4n79jM4SyPixmhST+D5O
         n1K2RYaxl643MofSFRmMDJX7BMUWAowM/QH2BE/lgPh9xtalWNgZ7gQY1FaX8VOzaL
         0buN4LH366T+t3Xo4JVAlo4fNTnnQCSZME2FD7M0dg1USyej5rH8KFxROkoy0BabCv
         ZV7y04beayolnJFe/10fiA3wkBYIu0A+rKGf6HW3pB/DyQGafZ7ei+asVyx3PACfi7
         RwtObpuC+C7EQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220517235919.200375-1-marex@denx.de>
References: <20220517235919.200375-1-marex@denx.de>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 13:10:25 -0700
User-Agent: alot/0.10
Message-Id: <20220615201027.DFCC3C3411A@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-05-17 16:59:18)
> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b=
/Documentation/devicetree/bindings/clock/clock-bindings.txt
> index f2ea53832ac63..d7f7afe2cbd0c 100644
> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>  Configuration of common clocks, which affect multiple consumer devices c=
an
>  be similarly specified in the clock provider node.
> =20
> +=3D=3DCritical clocks=3D=3D
> +
> +Some platforms require some clocks to be always running, e.g. because th=
ose
> +clock supply devices which are not otherwise attached to the system. One
> +example is a system where the SoC serves as a crystal oscillator replace=
ment
> +for a programmable logic device. The critical-clocks property of a clock
> +controller allows listing clock which must never be turned off.
> +
> +   clock-controller@a000f000 {
> +        compatible =3D "vendor,clk95;
> +        reg =3D <0xa000f000 0x1000>
> +        #clocks-cells =3D <1>;
> +        ...
> +        critical-clocks =3D <UART3_CLK>, <SPI5_CLK>;

Historically "critical" is overloaded in the clk framework. We should
avoid using that name. What does "critical" even mean?

Instead I'd prefer "always-on-clocks" here, so we can indicate that
these clks should always be on. It would also parallel the property in
the regulator framework.
