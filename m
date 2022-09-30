Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8E985F13DD
	for <lists+linux-clk@lfdr.de>; Fri, 30 Sep 2022 22:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiI3Unz (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 30 Sep 2022 16:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231644AbiI3Uny (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 16:43:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A13C1F4946;
        Fri, 30 Sep 2022 13:43:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8EFA6249D;
        Fri, 30 Sep 2022 20:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F4154C433D6;
        Fri, 30 Sep 2022 20:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664570632;
        bh=lwZZ6+zTSUIHHjtcDw9XM3OmNCeOForauk2Bs/ABEyo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gqxqGhqrtUSyz9FK/VHn5VkGs+wzOWFXmjmjltPzEYFP3qRCR9vM4zoBhnZZzAm/O
         4Ee/RXCA0pJDwuSfeHPadYdX3qyL4oANSa5TvNXdpBynRoyX2zk9gmgsnjHhsAS49m
         xZATUdLckIU5zl/WRzR/9Oii0mhHTk64W3coqmCUKfFt2DppyrQQKTEYYY30QK+7lm
         7wfZvT9CAHfQv/Q6mNlP1hOjDWnmRGO6yEGLrNyw5BRWzLkiFTAfMghFVOx9BxlQ8g
         IidEq8gC0Ou13mYEfJsy2KJmmnkYshDo4OOb8vm4Hhwu/QeeZYzGBT7EyIjkxTL4A1
         1UExIL8U3CAAw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220612192937.162952-4-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com> <20220612192937.162952-4-doug@schmorgal.com>
Subject: Re: [PATCH 03/12] dt-bindings: marvell,pxa168: add clock ids for additional dividers
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
To:     Doug Brown <doug@schmorgal.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Fri, 30 Sep 2022 13:43:50 -0700
User-Agent: alot/0.10
Message-Id: <20220930204351.F4154C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Doug Brown (2022-06-12 12:29:28)
> This adds a few new clocks divided from PLL1 and CLK32 that are
> potentially used by a few peripherals with muxed clocks.
>=20
> Signed-off-by: Doug Brown <doug@schmorgal.com>
> ---

Applied to clk-next
