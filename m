Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897C052F850
	for <lists+linux-clk@lfdr.de>; Sat, 21 May 2022 06:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235098AbiEUEPO (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Sat, 21 May 2022 00:15:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354364AbiEUEPN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 00:15:13 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9A8195EB4;
        Fri, 20 May 2022 21:15:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7410FB82F2B;
        Sat, 21 May 2022 04:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2443EC385A9;
        Sat, 21 May 2022 04:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653106505;
        bh=cGeqohzEq3pO7WtVL1/WGiNCikjXFQargsBMTKHAJfU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iG+QXWMit7REIdVZYpvG1QIoimMt+1EQ5bqaaBBb5L2EHQg850kbOsSe2e2H34UYz
         B2VvxvWGkpIltuk8wg7MRaOM6YhlE0rkkEq/YQ4MvWJnoX9cN4ydm2yrzraNUnIgGG
         Q3YxT6e6Xxwismx2+z28m31l89vvMcjUCFWjliL3hKwXPjHToSSDq6kzY5t8nkjLNY
         IHpPIk9C3kk8XqF5BGiHmiWRcrdNb5EHIJmmXvYIX1koqY4KUoHUZ1YRjzn/awRipg
         iT/eWXo+xcF7yY7xjPzJvAyYzFKeCmqlpf+c38JeUbna51mN3SLftB4o/LKWLiObuX
         Z4DfRCAUafYVQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516070600.7692-4-gabriel.fernandez@foss.st.com>
References: <20220516070600.7692-1-gabriel.fernandez@foss.st.com> <20220516070600.7692-4-gabriel.fernandez@foss.st.com>
Subject: Re: [PATCH v4 03/14] clk: stm32mp13: add stm32_mux clock management
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
Date:   Fri, 20 May 2022 21:15:03 -0700
User-Agent: alot/0.10
Message-Id: <20220521041505.2443EC385A9@smtp.kernel.org>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting gabriel.fernandez@foss.st.com (2022-05-16 00:05:49)
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> Just to introduce management of a stm32 mux clock.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---

Applied to clk-next
