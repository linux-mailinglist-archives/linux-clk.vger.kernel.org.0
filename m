Return-Path: <linux-clk+bounces-30675-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A319C5006E
	for <lists+linux-clk@lfdr.de>; Tue, 11 Nov 2025 23:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AE4304E5E34
	for <lists+linux-clk@lfdr.de>; Tue, 11 Nov 2025 22:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A3A32E888A;
	Tue, 11 Nov 2025 22:55:01 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B082857EF;
	Tue, 11 Nov 2025 22:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762901701; cv=none; b=E48jOMVfBSBC7iJpsUgJmx7SJ8Qw4K3Fd1cCR9eWNufnbVQqdeLAJsAaA0683yeQedzNP50z6OYb8QQwgcO0QW+QHh17YTpACgRA+zBHpSYSal9h/hxlE/fqth73Z1jBdUAoKWmucW29mSIlG+tH8JBEugVvemLsd/3q9mzMJg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762901701; c=relaxed/simple;
	bh=nOSBX6CgmSKAf5yW0oAcxHwAIFI5WNbj110HK9iguhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Crm0vmwYKRPccZOuRMu050Jqp0+HnlzXgcNIRwbsYMb3zzI51HHhXMqKmS9H2eFk97ZU45AJIfgMK4az87Cx0GVhRTaeD5lAEyl5Z1xjXReLA2DpiMrbFpgTrB2zAg8Jg+P5oNNVF09nzmmZj/Z0gqi+AEMAAbgnIwVg3Z0lElY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E79B6340E2A;
	Tue, 11 Nov 2025 22:54:58 +0000 (UTC)
Date: Wed, 12 Nov 2025 06:54:53 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] clk: spacemit: fix comment typo
Message-ID: <20251111225453-GYA1677982@gentoo.org>
References: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111-b4-fix-ccu-mix-typo-v2-1-d64b97b48d1f@gmail.com>

Hi Stephen:

On 23:50 Tue 11 Nov     , Encrow Thorne wrote:
> Fix incorrect comment to match the filename.
> 
> Reviewd-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Encrow Thorne <jyc0019@gmail.com>

Reviewed-by: Yixun Lan <dlan@gentoo.org>

> ---
> Hi Stephen,
> 
> Could you please take a look at this patch for inclusion?
> 
right, this is a trivial fix, and as there is no other clk patch
for SpacemiT this cycle, so can you simply take it via your tree?

thanks

-- 
Yixun Lan (dlan)

