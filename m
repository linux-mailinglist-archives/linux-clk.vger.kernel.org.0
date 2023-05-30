Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0931B716AF3
	for <lists+linux-clk@lfdr.de>; Tue, 30 May 2023 19:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231231AbjE3R3g (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 30 May 2023 13:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233221AbjE3R3f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 May 2023 13:29:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F332BE8;
        Tue, 30 May 2023 10:29:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 33CA361403;
        Tue, 30 May 2023 17:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CDFCC4339B;
        Tue, 30 May 2023 17:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685467742;
        bh=2bODZqzDsUoTQkh2zMk1nEE+wHElsvjQpmoMsf7f/Qk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hHOGYhzLNSVRW2KA0PSbdr+3tO52BK5i2Wf+B9H6AQC08PA1PFm0Bkwly4Xk+Zy6s
         fpjQGhv3AcA21h6GnNPWiSEPN3pI7J/t9TpNrcOlySMQHRr5sjkbiDF2yt71sn1ClN
         6FBrIyVa0KMjPrG6KZ6KmrmVvn+o9Il5gH1wEptuV+dQ6LmxKVh80QOdChihjaG2jt
         2j3mtGq60eXLP8Ralhy/kmZTikzXW7Vt7XQBRLdCD/ol94LsWHuNNhjZf+KyZMBetT
         cw6lGHcV7QJ9iBnCmUwTCh4/AatytoU1t2wjMpW7vK3IKmvAd2dVDvDTQNXAg0NkfD
         mWfjQxCFTIQUw==
Date:   Tue, 30 May 2023 18:28:55 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Neil Armstrong <neil.armstrong@linaro.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        "Lukas F. Hartmann" <lukas@mntre.com>,
        Nicolas Belin <nbelin@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 06/17] dt-bindings: display: add Amlogic MIPI DSI Host
 Controller bindings
Message-ID: <20230530-hankering-trident-9cab74e59591@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yUiZQebBLS7labwP"
Content-Disposition: inline
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-6-56eb7a4d5b8e@linaro.org>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--yUiZQebBLS7labwP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:38:07AM +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI
> transceiver (ver 1.21a) with a custom glue managing the IP resets,
> clock and data inputs similar to the DW-HDMI Glue on the same
> Amlogic SoC families.
>=20
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Welp, I was happy with it last time around before Krzysztof took a look,
and the things he pointed out seem to be fixed, so you can have my R-b
back.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--yUiZQebBLS7labwP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYyVwAKCRB4tDGHoIJi
0mZYAQDW0DCO9lI9BrijwwOdNaACzk5HrgyW4ZHkJfjAmf3d6AD/cQb89WQt5+7E
yfiA12g1wqL5SmEpqaTBIFYHn1cucAo=
=v6gU
-----END PGP SIGNATURE-----

--yUiZQebBLS7labwP--
