Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076D152F84B
	for <lists+linux-clk@lfdr.de>; Sat, 21 May 2022 06:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350761AbiEUEPU (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 21 May 2022 00:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353683AbiEUEPT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 00:15:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722DD195925;
        Fri, 20 May 2022 21:15:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 682FB60109;
        Sat, 21 May 2022 04:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A76C385A9;
        Sat, 21 May 2022 04:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653106515;
        bh=ZOX6ujBcMnT7GDeHWouQ9gtLDH8gdmG9zioCEXGXYII=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=SakLCbZLYal0PnCmDP06gQFnGApWEwK/hW5pccJ3X9GXrPGii0QrgpWQSjaXkjbkT
         AdIdJsptFfqFL1L2hAeEtvlCZmKjZlLArqikHTeCGmOEnaPKSxzwMuT9DAuHuuwou1
         qDElSNgVOet4HKcnA/5sRFa5Hek4QTU5k4Cqvkmq/0t2HevaMXfWVt+y97t2EaSVw5
         PJ636UG18l1KD8CzPeCJdB3E2Xv5SomaK907A6ubrSoyWDfBtKjdAwo6qQwnrLA6Ve
         GAbdaqY5Y4XCCWaam3jy0nRnZAatPvuUgvuy244FLFSUaaFz/k18/sc/Xl+SZhg8UP
         PliAJ9AIw69GA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516070600.7692-5-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com> <20220516070600.7692-5-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH v4 04/14] clk: stm32mp13: add stm32_gate management
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 20 May 2022 21:15:13 -0700
User-Agent: alot/0.10
Message-Id: <20220521041515.B9A76C385A9@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:50)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> Just to introduce management of a stm32 gate clock.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
