Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794622749A9
	for <lists+linux-clk@lfdr.de>; Tue, 22 Sep 2020 21:59:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIVT71 (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Tue, 22 Sep 2020 15:59:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:55744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbgIVT70 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 22 Sep 2020 15:59:26 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 36776221E8;
        Tue, 22 Sep 2020 19:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600804766;
        bh=/LlZN26pgTfonCnAlR2RVC9G8UJExvV865I+VL0lQOY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nxPKDQ5xM0m4Z2dehb0I4hOe9OygBMM8lNBd6i+BESbAJYuV2V1EWrRwEChSPJjQA
         DjuPB9JM0JZ5UV2T/KnqkBEIY85imBoEsJmsJnB1pX1rji1vlS7eenYYIycWU4YjF6
         yo2TomLhwsoqb19mxp6oksOAV6yHNjaJC+yLr+Ac=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200907085740.1083-3-t-kristo@ti.com>
References: <20200907085740.1083-1-t-kristo@ti.com> <20200907085740.1083-3-t-kristo@ti.com>
Subject: Re: [PATCH 2/3] clk: keystone: sci-clk: cache results of last query rate operation
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com
To:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, ssantosh@kernel.org
Date:   Tue, 22 Sep 2020 12:59:24 -0700
Message-ID: <160080476488.310579.12206140794528138851@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2020-09-07 01:57:39)
> Cache results of the latest query rate operation. This optimizes the
> firmware interface a bit, avoiding unnecessary calls to firmware if we
> know the result already; the firmware interface is pretty expensive
> to use for query rate functionality.
>=20
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---

Applied to clk-next
