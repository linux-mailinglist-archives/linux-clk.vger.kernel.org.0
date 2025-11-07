Return-Path: <linux-clk+bounces-30504-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4AC3ECF8
	for <lists+linux-clk@lfdr.de>; Fri, 07 Nov 2025 08:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0A73188DE9B
	for <lists+linux-clk@lfdr.de>; Fri,  7 Nov 2025 07:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FB41E1A17;
	Fri,  7 Nov 2025 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k+bClqF4"
X-Original-To: linux-clk@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800252571C5
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501621; cv=none; b=Xi7a3bHn4UrfIaMC4/RFW2WltUxUAabvo/qNJ3P5hF+6c2dJNfcePIK78pTb5uHgIgXhDBrkf93rf3xRr3cNSrgkum5K017Y/l8YCwV/6OHG3lNrhn68PuIWDxzsiqi3sSpuKvS/8ZoDdFvq5OAzZL5rIokRxuT9hVRSK0cnZHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501621; c=relaxed/simple;
	bh=up3WN4y2iaAHVkgmKOuF19xMqSjPj8hRQ0/2Guibtpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RLFl+0gIRvXUkNTdVXVdWUzaqBnni/qWGkcszGktXSSN5HZvokGJrjnpczlBqnkNxHJNyP0SR+2E0o8cY8HYIIZX0T5simpKDd169IfkQhFXfVWFCQJj5VYK1erGaeJ539ng83UyMBbOrUclofxUcZ/izCUVjEzGJXu+hCHqsAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k+bClqF4; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Fri, 7 Nov 2025 15:46:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762501607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWV3OFRTCNAKsBedYT67BomPXMjaLCiUco2GhaTf0fw=;
	b=k+bClqF4XA4GZLSsMVcC4JpBztPM6DaIwF+4+MhuR0v+m0IO2O9SigAjsrr2iZzzDfgEtI
	4/4nozJFfpBwrLrYCWO/kTQe007F3NCPNYKHGUMFN8tKGpHg3HFVdcftKPD6uUxYkTZm0u
	qklEY0aV3aO/4Z1KU5PuZoGxTlcsStQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: eswin: Documentation for
 eic7700 SoC
Message-ID: <aQ2j4PtWm5vFBoAZ@kernel.org>
References: <20251023071658.455-1-dongxuyang@eswincomputing.com>
 <20251023071748.513-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023071748.513-1-dongxuyang@eswincomputing.com>
X-Migadu-Flow: FLOW_OUT

On Thu, Oct 23, 2025 at 03:17:48PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add device tree binding documentation for the ESWIN eic7700
> clock controller module.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
LGTM. But as Krzysztof mentioned, it might not be on the
priority review list.

Acked-by: Troy Mitchell <troy.mitchell@linux.dev>

