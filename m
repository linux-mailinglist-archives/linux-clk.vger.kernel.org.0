Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 278B454D790
	for <lists+linux-clk@lfdr.de>; Thu, 16 Jun 2022 03:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355839AbiFPBzw (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 15 Jun 2022 21:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354844AbiFPBzv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 21:55:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10CD396A2;
        Wed, 15 Jun 2022 18:55:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 93940B82270;
        Thu, 16 Jun 2022 01:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36508C3411A;
        Thu, 16 Jun 2022 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655344548;
        bh=2qCrPucC3JK+fYu3hWuKG7P3Nf0KKZKQWh5F+1cXFX8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I65GcgDIrl4CcSvK+uk8w9piAfvRWP+RqcYJCBrtR1MoDkgN4o+0WByYM1GzcGYmh
         rwNDGc4SIyzlhTQqSLqUVracmpnxagNJbho9mU2xhf1jNxlWZPtOygsh90heU+aUBq
         Td7PtNHmcEKpPuIdoGARxHa+THYlzUKS3bgAqI76NiSoB4LDOKeJo1kVKAnjUau2Lu
         nOv91UUgL0pjkI6mTMB110ANraZtst77Tn7ehkHsG/4xM8yDbQB2QIViMLS0rw5/Uq
         dz1u8DhVATU1B9OUeeWNcOF+4+BIrg0SGt0yjSdJ2Pp71+/a0sdKljTIEcPeeaXMBL
         nCVspYszt7IIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220523093346.28493-19-rex-bc.chen@mediatek.com>
References: <20220523093346.28493-1-rex-bc.chen@mediatek.com> <20220523093346.28493-19-rex-bc.chen@mediatek.com>
Subject: Re: [RESEND v8 18/19] dt-bindings: arm: mediatek: Add #reset-cells property for MT8186
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        nfraprado@collabora.com, chun-jie.chen@mediatek.com,
        wenst@chromium.org, runyang.chen@mediatek.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Rex-BC Chen <rex-bc.chen@mediatek.com>
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Date:   Wed, 15 Jun 2022 18:55:45 -0700
User-Agent: alot/0.10
Message-Id: <20220616015548.36508C3411A@smtp.kernel.org>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Rex-BC Chen (2022-05-23 02:33:45)
> We will use the infra_ao reset which is defined in mt8186-sys-clock.
> The value of reset-cells is 1.
>=20
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---

Applied to clk-next
