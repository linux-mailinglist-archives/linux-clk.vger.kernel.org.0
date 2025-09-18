Return-Path: <linux-clk+bounces-27904-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514AB596AA
	for <lists+linux-clk@lfdr.de>; Tue, 16 Sep 2025 14:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B0C432456A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Sep 2025 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DAE321B9C9;
	Tue, 16 Sep 2025 12:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J9lztbWV"
X-Original-To: linux-clk@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4EC1CAA7D;
	Tue, 16 Sep 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758027236; cv=none; b=hd6Wbcl4jxFY728ddAQK3EF8gG1pK3QL70gQT73bUwZ39ml388q0Ah6OTacPgC5JZDwU2vj0Hsr64cxTzWdPf+b2ABKVq3HuMGq+s6RgA3R+ecspK6WNqb6qswzWZDC06Lk1xfYHukx50OW61InBlASqfyJUUkZZ4Wj29imTQ54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758027236; c=relaxed/simple;
	bh=1Zbi/53ecUSSnOmf2N5VxqtKhKjyIluT57/tiPpaTLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdTB4YqTNTKsW1tglsiEF5Sy85H23XTUuhUeZ+/NlacD4oECgYJYbyNDocJdHnVUWWMVb1a8kP+bVQQnWlQX//zjl3ZiE7SZ9nad6I6nl3PjiC8pJCx36Ki4rJLcAXfkixC6dgS9on2gYtUpBVPqYknMXSc6ViLA8orSYo8Zpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J9lztbWV; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758027235; x=1789563235;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1Zbi/53ecUSSnOmf2N5VxqtKhKjyIluT57/tiPpaTLA=;
  b=J9lztbWVWKjRhUIuuZ2lAs92Quxf/oIsOwm2FqfJ3mMsEL6+x3uoI/aG
   pGRInpaTJ0+eypfI1V355T8ph3hopkUxlbDtn8zOMgQvOsVi6/FIoNvEu
   iFFfauJwA1f87AUx93Hhv0TEQ1l5CDZikjjL5n+AQLVeCTz+YUkojX/Qm
   /bjSVRILxZ5Ql4spF65KqnNT4ox5fcsPC/h66CojZDpirv6+S3WEgcdf7
   Y9TUxQq9ugDb1jdIw4gNGkYLZX1l2dFP3CiRSkyV+JomlWRWBV2pWq5qo
   to5uKNTxh4AQCexH/ea45giZfS6JRe3G9atvQFYtDR2VxWW9WoMiNglwY
   w==;
X-CSE-ConnectionGUID: Dsq29EpJQi+nTePjGT73ig==
X-CSE-MsgGUID: EGMTbNNqRSmyWiO0zPvaQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85742723"
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="85742723"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:53:52 -0700
X-CSE-ConnectionGUID: DSG+MD6ZQ7uCDmOxy/Z1qQ==
X-CSE-MsgGUID: mF3y6s1ESxSOrKDg5nDjKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,269,1751266800"; 
   d="scan'208";a="174044835"
Received: from smile.fi.intel.com ([10.237.72.51])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 05:53:50 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uyVBq-00000003Wrk-30IW;
	Tue, 16 Sep 2025 15:53:46 +0300
Date: Tue, 16 Sep 2025 15:53:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1] clk: keystone: sci-clk: use devm_kmemdup_array()
Message-ID: <aMld2nQFIIt1aZwa@smile.fi.intel.com>
References: <20250916124518.2857524-1-raag.jadav@intel.com>
 <aMldk7M05W77rRw_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMldk7M05W77rRw_@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 16, 2025 at 03:52:35PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 16, 2025 at 06:15:18PM +0530, Raag Jadav wrote:
> > Convert to use devm_kmemdup_array() which is more robust.
> 
> FWIW,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

However, you might also want to use sizeof(*clks) IIUC.

-- 
With Best Regards,
Andy Shevchenko



