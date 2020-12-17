Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77722DCEEF
	for <lists+linux-clk@lfdr.de>; Thu, 17 Dec 2020 10:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgLQJ4W (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Thu, 17 Dec 2020 04:56:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:44262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726580AbgLQJ4V (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Dec 2020 04:56:21 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608198941;
        bh=9u9rR8QgcN90ODc0IqhrROjxCmPDE1yhQPWbcc3QkQU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=XaYi/glE3LLbmLwqukaXoZulyNdFQBKlbcWdb+4vhwK+7jhp/2g8QrdIisSU5GJVX
         C3gBP3PoMh0v5K+mpZXWvxJhHSNC1NhlbtK/Y6iDJhc9EFWQEQd7vOBEGc6Q/Zwxw5
         yaVMGMYnL2h1tjdrl25lySxgY45NE1ptpXMgv+pXy7lK7Uo0VO/BDSfl3DyQS5GfUB
         q5IiS5CBu68voTuYyFUKHo+MdergZ9z9qIxYF4ymXMYwCjHQ5VElu1sBBAMfXjW6XN
         PPuWbzdLeY9laC4bJo6yQnlxSu3/UrLGiduPenlDqYAw/XVedONStir0X/zrpY75pc
         aSdj05+um1rng==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201207105050.2096917-1-maxime@cerno.tech>
References: <20201207105050.2096917-1-maxime@cerno.tech>
Subject: Re: [PATCH v2] clk: trace: Trace range functions
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Thu, 17 Dec 2020 01:55:38 -0800
Message-ID: <160819893867.1580929.15945282649901010469@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2020-12-07 02:50:50)
> The clk_set_range functions don't have any tracepoints even though it
> might be useful. Fix this.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>=20
> ---

Applied to clk-next
