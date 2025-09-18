Return-Path: <linux-clk+bounces-26920-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2A0B3B7F8
	for <lists+linux-clk@lfdr.de>; Fri, 29 Aug 2025 11:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1614B189CB05
	for <lists+linux-clk@lfdr.de>; Fri, 29 Aug 2025 09:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DA6304BCD;
	Fri, 29 Aug 2025 09:59:26 +0000 (UTC)
X-Original-To: linux-clk@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C9221C5D72;
	Fri, 29 Aug 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756461566; cv=none; b=XWHJZeywBcQi4GC9+DLk3dnuqx3rp3T2KLElAtBXM25XOZt9RVVll+3YJNVyvHxstb97kHsJi0nSloy17wnxU0vzmEvtwbvT73todHYD6SOIpCXpH6c1BHbtpL79VlnH5dxSqRmpFQrSmQjkSwojP0bDuZQQoiJ2MdpOOc9tujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756461566; c=relaxed/simple;
	bh=sbsTpvesguyPzn4lXJKCI8/Damqt6BObQ+yJQw0/JkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mGiqC+6GTTKBHbLRHyMItx5W2iy7XlQAFHNT0NfOj0msKab74XYfh+03CT8sYfgj9Qkx5E4ijSFbRv1IHrliTkMAEJptIjeJqsiv2y+QFh9X20cZ25E58/ubH5dulRrKbZopFAIS6vcypPqF+5YK2a8JMIu0xZ8D3PpTpMe3R54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6509C15A1;
	Fri, 29 Aug 2025 02:59:11 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D38FB3F694;
	Fri, 29 Aug 2025 02:59:17 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:59:15 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] clk: scmi: migrate round_rate() to determine_rate()
Message-ID: <20250829-fine-tacky-sturgeon-0ba3c4@sudeepholla>
References: <20250827-clk-scmi-round-rate-v2-1-3782a50835ed@redhat.com>
 <20250829100903.GB16625@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829100903.GB16625@nxa18884-linux.ap.freescale.net>

On Fri, Aug 29, 2025 at 06:09:03PM +0800, Peng Fan wrote:
> On Wed, Aug 27, 2025 at 01:12:07PM -0400, Brian Masney wrote:
> >This driver implements both the determine_rate() and round_rate() clk
> >ops, and the round_rate() clk ops is deprecated. When both are defined,
> >clk_core_determine_round_nolock() from the clk core will only use the
> >determine_rate() clk ops.
> >
> >The existing scmi_clk_determine_rate() is a noop implementation that
> >lets the firmware round the rate as appropriate. Drop the existing
> >determine_rate implementation and convert the existing round_rate()
> >implementation over to determine_rate().
> >
> >scmi_clk_determine_rate() was added recently when the clock parent
> >support was added, so it's not expected that this change will regress
> >anything.
> >
> >Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Peng,

It would be great if you can test it with parent clock support on i.MX
platforms just to be sure this doesn't regress anything.

-- 
Regards,
Sudeep

