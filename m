Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8ED5F13F5
	for <lists+linux-clk@lfdr.de>; Fri, 30 Sep 2022 22:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbiI3UpM (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Sep 2022 16:45:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbiI3UpI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:45:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 559FD26574;
        Fri, 30 Sep 2022 13:44:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id ECA81B82A17;
        Fri, 30 Sep 2022 20:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A123CC433D7;
        Fri, 30 Sep 2022 20:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570690;
        bh=1zpLBiqzJ5FTAyGCswCu34suTkQdnEqTgHkeObrEysI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gqP5LbMaMkHuFp+yniXLvKzVyY1mEMrSRBFsh4P3D1RtI6NBsR4geiJg85+IlENJ/
         GlSIwNWzAHrISHtTWtShDDhqp0QeZSIQiEPU0cT+llElr6eP52HG1vUPndf4kMFxyk
         yYQEsA4N+u6epNcsXq1K998mHCRHthbRbspdVHwTNTlYgdAueEu6fDd/qSB0maCwu0
         zRthgjcqpuaeUUxbrTbqAbu/dXSqiHwShSzJp6rSm7xGb8G7GggizCecH2f63nv1VU
         Y99qiT4TUJIMcuoX/FZA5wwtOQLHof435l6qri4czOC3EYc8Y5fe6J1yTPsaoGVJem
         PTZjMdQwMq/1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-10-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-10-doug@schmorgal.com>
Subject: Re: [PATCH 09/12] dt-bindings: marvell,pxa168: add clock id for SDH3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:44:48 -0700
User-Agent: alot/0.10
Message-Id: <20220930204450.A123CC433D7@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:34)
> There are four SDHC peripherals on the PXA168, but only three of them
> were present in the DT bindings. This commit adds the fourth.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
