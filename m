Return-Path: <linux-clk+bounces-9641-lists+linux-clk=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-clk@lfdr.de
Delivered-To: lists+linux-clk@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E927D93201B
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A249F283A5A
	for <lists+linux-clk@lfdr.de>; Tue, 16 Jul 2024 05:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEED17556;
	Tue, 16 Jul 2024 05:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdZGXrU2"
X-Original-To: linux-clk@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D018817588
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 05:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721108193; cv=none; b=dTIoE95OkCNh6Vriqk3htX/A1A9RL4f3EtzLDIVyzJUAOoDBQ03kJ6hqaoImE9BkMX8qFhMUUBGDwMcwZoYs1VA5MpHpCUS5/tptSBMH8An8c/eReg0n4llJ0J7WhF/Lw72HYA9mBWdt/IJalfleT0WuHyoRq4NQ5Ix1CqJmnl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721108193; c=relaxed/simple;
	bh=h6TWkDoziHBaJBlkDkyJ2AMrDokzRXzfJGIdXI/Mn68=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a/BpXm2KUhRGkMoZGzNPFRpgvSxFWJXJ7Hs8YbC0nRmQsi76T4z2srSAPtnHx80zwE9SUGDveDPdPee2AuJ2QHGcgvfclHAXOyQ+R+3K1f9j2h0SflJFi45jEEkrQiYKh2TPUNa3I4/flw+BRn9rQR+MwsvXVXAW4bW4VRAg+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdZGXrU2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721108191; x=1752644191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h6TWkDoziHBaJBlkDkyJ2AMrDokzRXzfJGIdXI/Mn68=;
  b=RdZGXrU2sEV4jfOrDDcscYuUjcYfgFSlzVFH0xHBGyP9a+VYJ+BLumm0
   jgyIuyVSaLWq40E7cYnFPBQ2dx7ZhR4yWEcYA9m9N2tRfKfsKHCHMwziF
   6+qiOAjPYDq4EBEwqQCdFvFF3Rsi7vwiClaExdDK9TYmXrlGEbNXpiDOV
   wd5hiUbJWtdNsLBmz/y6U40/ODw0hxY1Q4NgdtswoqcWUE/vnjj1kDHiB
   3Ol877dU2qvnPi8opXHwzBaamKie4aYanB2wGpcJM/VCWfFeRkB2dKLyY
   bPWaa4DVhKwfD/JrpFnvwD4SMXsbafabkabV051qfpBM2FePJ6dktDgWH
   w==;
X-CSE-ConnectionGUID: grliGSTeQO6wlzhpKPHIQA==
X-CSE-MsgGUID: o9BgKYeeTFqSWLM8UQJi9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="43948380"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="43948380"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 22:36:30 -0700
X-CSE-ConnectionGUID: Bus7ArYtQxa27yB5uMibCg==
X-CSE-MsgGUID: 7w4vyixoRpqvxQFJFPxmOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="55035023"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2024 22:36:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTarR-000exZ-2v;
	Tue, 16 Jul 2024 05:36:25 +0000
Date: Tue, 16 Jul 2024 13:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	David Gow <davidgow@google.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Subject: [clk:clk-kunit 6/10] ERROR: modpost:
 "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_test.ko] undefined!
Message-ID: <202407161349.6AIQsgSE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-kunit
head:   9f8bbc66021282d0646d1f8422265c72e671b5d1
commit: aa46879db9ac9672a04eb4755169086cb3e49311 [6/10] of: Add a KUnit test for overlays and test managed APIs
config: i386-randconfig-001-20240716 (https://download.01.org/0day-ci/archive/20240716/202407161349.6AIQsgSE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161349.6AIQsgSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161349.6AIQsgSE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcuscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/torture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/ext4/ext4-inode-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/fat/fat_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nfs/nfsv4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/unicode/utf8-selftest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_arc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/smb/common/cifs_md4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/kunit/kunit-example-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/packet-serdes-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/of/kunit_overlay_test.dtbo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/kunit_overlay_test.dtbo.o
>> ERROR: modpost: "__dtbo_kunit_overlay_test_begin" [drivers/of/overlay_test.ko] undefined!
>> ERROR: modpost: "__dtbo_kunit_overlay_test_end" [drivers/of/overlay_test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

