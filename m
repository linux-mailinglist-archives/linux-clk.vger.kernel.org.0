Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F4459A7E9
	for <lists+linux-clk@lfdr.de>; Fri, 19 Aug 2022 23:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbiHSVmu (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Fri, 19 Aug 2022 17:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiHSVmt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Aug 2022 17:42:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBA110DCD5
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 14:42:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7ACCA6177D
        for <linux-clk@vger.kernel.org>; Fri, 19 Aug 2022 21:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3079C433D6;
        Fri, 19 Aug 2022 21:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660945367;
        bh=AawV2mEMkPAqpUiBbdYiU4zaKIciI46+0fh/k1Wpntg=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=Q2ZjwxEN9p1TaoZAyvpLfXLH2Gz3UrWtvisZfAieW7eR5bhUx0bZ4jxPyqr6RUowq
         KewzuWAoY15bX5qpOy/52u3rluODh+TCKwQ02qFx9mBt6X4TRmAEGWuN3j/Yq9WFUt
         MOWLgs8VaosmFYt5HtYY2hSztD+2SmtdCPAFpotVL8RYO80eGrpd6MgjBJGHHS7PHz
         pGrLsOX4Q4+EJkLea6gio4heOc+ttrzwW1eXxFPrEdN5j8XHLWON7f3Gmdn0zREzLi
         K745VtC3YgrvpSrW+jhnxfTOGH1d5amsaWTppqVrK4FaruwVbeV/bX/gI+eelCk/ib
         7CRSshNJkoCvA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220630143949.218922-1-windhl@126.com>
References: <20220630143949.218922-1-windhl@126.com>
Subject: Re: [PATCH v3] clk: at91: dt-compat: Hold reference returned by  of_get_parent()
From:   Stephen Boyd <sboyd@kernel.org>
To:     alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
        linux-clk@vger.kernel.org, mturquette@baylibre.com,
        nicolas.ferre@microchip.com, windhl@126.com
Date:   Fri, 19 Aug 2022 14:42:46 -0700
User-Agent: alot/0.10
Message-Id: <20220819214247.D3079C433D6@smtp.kernel.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Liang He (2022-06-30 07:39:49)
> We need to hold the reference returned by of_get_parent() and use
> it to call of_node_put() for refcount balance.
>=20
> Signed-off-by: Liang He <windhl@126.com>
> ---

Applied to clk-next
