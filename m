Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1336D79B9CB
	for <lists+linux-clk@lfdr.de>; Tue, 12 Sep 2023 02:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355469AbjIKV7z (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Mon, 11 Sep 2023 17:59:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244397AbjIKUVE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2023 16:21:04 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7903185
        for <linux-clk@vger.kernel.org>; Mon, 11 Sep 2023 13:20:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657EAC433C8;
        Mon, 11 Sep 2023 20:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694463659;
        bh=Zpt/ADcqU/4L7h9zmLe0A8JKBjAGj8NLh4xHKXScM5k=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=kj8z6b6hsFWSSTlLgUYT16b/QzAxHGIzgwEQUGxV8euHNiIt1etaeww5BVNJJIW4b
         cFbv6dNP+Pbr4pe2XdkQBN/liJObpJ43b7G/MbGMGA48AKWDOAWdSy/z5e+tk0o7PP
         +GBelrEcbbWvhVczPUC5NZgLhVoYKeuLTrsA6jT+jYOT/6OpwmDrYwgyAiloLi/ix1
         AFLjmqaOgNxUGfXuvOSa6OBF4Y2gVIU6UblQyrB7cD/OQvfkqwfYeDJX9aMGikn0Zy
         NRQzFD3C3xykbX2ySNEtK01LWG0B8MYmBbr9dEokqzNmpd4m1C8Qg068HKbRgU64/b
         P1m/FJImRjFtQ==
Message-ID: <d4b86ce6982c48c3a443ca20872701e5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d47978a09dd0320f9929a19fa3e829608a02b224.1693485415.git.baruch@tkos.co.il>
References: <d47978a09dd0320f9929a19fa3e829608a02b224.1693485415.git.baruch@tkos.co.il>
Subject: Re: [PATCH v2] clk: gate: fix comment typo and grammar
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>
To:     Baruch Siach <baruch@tkos.co.il>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Mon, 11 Sep 2023 13:20:57 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Baruch Siach (2023-08-31 05:36:55)
> Change ouput -> output.
>=20
> While at it change also grammatically incorrect "it's" to "its".
>=20
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---

Applied to clk-next
