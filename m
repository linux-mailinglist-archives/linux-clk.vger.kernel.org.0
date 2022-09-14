Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1E35B8C3D
	for <lists+linux-clk@lfdr.de>; Wed, 14 Sep 2022 17:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbiINPum (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 14 Sep 2022 11:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiINPuh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Sep 2022 11:50:37 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C813B5720F;
        Wed, 14 Sep 2022 08:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3A44261782;
        Wed, 14 Sep 2022 15:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E45C433C1;
        Wed, 14 Sep 2022 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663170635;
        bh=S28EkrNLwS69diRhkX+rhYqUGi8w409B1c6Xk4uXdA4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=C1M6MQGrR9MJB1trIJC+waXGVZ4KZTTS+JTEOpiEsWCK7+PWOVMNeHPvSp5Zl4s8J
         hHMEIylwNYQu3JpzME1k3+hI7h8ay3mg8Fyq4l/C+ahofwmf0Rn3jdPCSzhKqsnDrx
         kysQUItpAD3rBHGQLray2SjAX1d2+eCxXKLh3tDQHNB9cyN3oCMEsDVHIY4mDkxNH6
         anaFqGtVu5W6ZNvtaBld6rImlbyjnnJ9hJP5j/LOhvlg2dlMMqaT5gS/zFChRTCGrh
         1ShOEbmH3O+HVdVPwSmLqlIKfrr+nNcBJclbNQrjDOz8WoD/FudG4ZvVFX0Tv2SM7J
         CrNyxNvTJ96EQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
References: <20220815-rpi-fix-4k-60-v1-0-c52bd642f7c6@cerno.tech> <20220815-rpi-fix-4k-60-v1-2-c52bd642f7c6@cerno.tech>
Subject: Re: [PATCH v1 2/7] clk: bcm: rpi: Add a function to retrieve the maximum
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, Dom Cobley <popcornmix@gmail.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <mripard@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Date:   Wed, 14 Sep 2022 08:50:33 -0700
User-Agent: alot/0.10
Message-Id: <20220914155035.88E45C433C1@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-08-15 08:31:24)
> @@ -254,6 +255,33 @@ static int raspberrypi_fw_dumb_determine_rate(struct=
 clk_hw *hw,
>         return 0;
>  }
> =20
> +unsigned long rpi_firmware_clk_get_max_rate(struct clk *clk)
> +{
> +       const struct raspberrypi_clk_data *data;
> +       struct raspberrypi_clk *rpi;
> +       struct clk_hw *hw;
> +       u32 max_rate;
> +       int ret;
> +
> +       if (!clk)
> +               return 0;
> +
> +       hw =3D  __clk_get_hw(clk);

Ideally we don't add more users of this API. I should document that :/

It begs the question though, why do we need this API to take a 'struct
clk'?  Can it simply hardcode the data->id value for the clk you care
about and call rpi_firmware_property() directly (or some wrapper of it)?

Furthermore, I wonder if even that part needs to be implemented.  Why
not make a direct call to rpi_firmware_property() and get the max rate?
All of that can live in the drm driver. Making it a generic API that
takes a 'struct clk' means that it looks like any clk can be passed,
when that isn't true. It would be better to restrict it to the one use
case so that the scope of the problem doesn't grow. I understand that it
duplicates a few lines of code, but that looks like a fair tradeoff vs.
exposing an API that can be used for other clks in the future.

> +       if (!hw)
> +               return 0;
> +
> +       data =3D clk_hw_to_data(hw);
> +       rpi =3D data->rpi;
> +       ret =3D raspberrypi_clock_property(rpi->firmware, data,
> +                                        RPI_FIRMWARE_GET_MAX_CLOCK_RATE,
> +                                        &max_rate);
