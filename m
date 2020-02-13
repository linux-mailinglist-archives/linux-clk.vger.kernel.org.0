Return-Path: <linux-clk-owner@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 136BD15B4FB
	for <lists+linux-clk@lfdr.de>; Thu, 13 Feb 2020 00:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgBLXnB (ORCPT <rfc822;lists+linux-clk@lfdr.de>);
        Wed, 12 Feb 2020 18:43:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:59000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727117AbgBLXnA (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 12 Feb 2020 18:43:00 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BBA32168B;
        Wed, 12 Feb 2020 23:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581550980;
        bh=lk/1u/yqXtO5N1TnkPwjmCKI54ya6bM52pKUKl0+978=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=zKl4Cf/BnhXfBlUgbT4BwheG0TyJAHy6Lbtyqu9aBUqK35J0PAE1HglrrmLMkgYFn
         mFeus5KwSG80BT8tp3oatxULBhk4FqzbQdyVKNk8OMc7TMog2GCRtzAEZ0oXWjtlNA
         OP8qbJW8+eowDODjP6XYGnQhFWbFUnv+pR64SNFI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <c59d3637-5691-3595-e0f5-f87d15e272ba@kernel.org>
References: <20200114160726.19771-1-dinguyen@kernel.org> <20200114160726.19771-2-dinguyen@kernel.org> <c59d3637-5691-3595-e0f5-f87d15e272ba@kernel.org>
Subject: Re: [PATCH 2/2] clk: socfpga: stratix10: simplify paramter passing
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, linux-clk@vger.kernel.org
To:     Dinh Nguyen <dinguyen@kernel.org>
Date:   Wed, 12 Feb 2020 15:42:59 -0800
Message-ID: <158155097933.184098.6917298388067951995@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dinh Nguyen (2020-02-04 07:29:44)
> Ping? Hopefully, there aren't any issues with these patches?

Was there a cover letter? Will there be more patches? Seems like it's
mostly code shuffling in preparation for something else.
